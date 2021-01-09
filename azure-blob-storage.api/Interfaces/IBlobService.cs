using azure_blob_storage.api.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace azure_blob_storage.api.Interfaces
{
    public interface IBlobService
    {
        Task<BlobInfo> GetBlobAsync(string blobName);
        Task<IEnumerable<string>> GetAllAsync();
        Task UploadFileBlobAsync(string filePatch, string fileName);
        Task UploadContentBlobAsync(string content, string fileName);
        Task DeleteBlobAsync(string blobName);
    }
}
