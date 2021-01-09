using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using azure_blob_storage.api.Extension;
using azure_blob_storage.api.Interfaces;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using BlobInfo = azure_blob_storage.api.Models.BlobInfo;

namespace azure_blob_storage.api.Services
{
    public class BlobService : IBlobService
    {
        private readonly IConfiguration _configuration;
        private readonly BlobServiceClient _blobServiceClient;

        public BlobService(IConfiguration configuration, BlobServiceClient blobServiceClient)
        {
            _configuration = configuration;
            _blobServiceClient = blobServiceClient;
        }

        public async Task<IEnumerable<string>> GetAllAsync()
        {
            var blob = _configuration.GetValue<string>("BobStorage:BlobName");
            var containerClient = _blobServiceClient.GetBlobContainerClient(blob);
            var items = new List<string>();

            await foreach (var blobItem in containerClient.GetBlobsAsync())
            {
                items.Add(blobItem.Name);
            }
            return items;
        }

        public async Task<BlobInfo> GetBlobAsync(string blobName)
        {
            var blob = _configuration.GetValue<string>("BobStorage:BlobContainerName");
            var containerClient = _blobServiceClient.GetBlobContainerClient(blob);

            var blobClient = containerClient.GetBlobClient(blobName);
            var blobDownloadInfo = await blobClient.DownloadAsync();
            return new BlobInfo()
            {
                Content = blobDownloadInfo.Value.Content,
                ContentType = blobDownloadInfo.Value.ContentType
            };
        }

        public async Task UploadFileBlobAsync(string filePatch, string fileName)
        {
            var blob = _configuration.GetValue<string>("BobStorage:BlobContainerName");
            var containerClient = _blobServiceClient.GetBlobContainerClient(blob);
            var blobClient = containerClient.GetBlobClient(fileName);
            await blobClient.UploadAsync(filePatch, new BlobHttpHeaders { ContentType = filePatch.GetContentType() });
        }

        public async Task UploadContentBlobAsync(string content, string fileName)
        {
            var blob = _configuration.GetValue<string>("BobStorage:BlobContainerName");
            var containerClient = _blobServiceClient.GetBlobContainerClient(blob);
            var blobClient = containerClient.GetBlobClient(fileName);
            var bytes = Encoding.UTF8.GetBytes(content);
            await using var memoryStream = new MemoryStream(bytes);
            await blobClient.UploadAsync(memoryStream, new BlobHttpHeaders { ContentType = fileName.GetContentType() });
        }

        public async Task DeleteBlobAsync(string blobName)
        {
            var blob = _configuration.GetValue<string>("BobStorage:BlobContainerName");
            var containerClient = _blobServiceClient.GetBlobContainerClient(blob);
            var blobClient = containerClient.GetBlobClient(blobName);

            await blobClient.DeleteIfExistsAsync();

        }

    }
}
