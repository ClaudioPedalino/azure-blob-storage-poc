using azure_blob_storage.api.Dtos;
using azure_blob_storage.api.Interfaces;
using azure_blob_storage.api.Queries;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace azure_blob_storage.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlobController : ControllerBase
    {
        private readonly IBlobService _blobService;

        public BlobController(IBlobService blobService)
        {
            _blobService = blobService;
        }


        [HttpGet("{blobName}")]
        public async Task<IActionResult> GetBlobAsync(string blobName)
        {
            var data = await _blobService.GetBlobAsync(blobName);
            return File(data.Content, data.ContentType);
        }

        [HttpGet("list")]
        public async Task<IActionResult> GetAllBlobAsync()
        {
            return Ok(await _blobService.GetAllAsync());
        }

        [HttpPost("upload-file")]
        public async Task<IActionResult> UploadFileAsync([FromBody] UploadFileRequest request)
        {
            await _blobService.UploadFileBlobAsync(request.FilePatch, request.FileName);
            return Ok();
        }

        [HttpPost("upload-content")]
        public async Task<IActionResult> UploadContentAsync([FromBody] UploadContentRequest request)
        {
            await _blobService.UploadContentBlobAsync(request.Content, request.FileName);
            return Ok();
        }


        [HttpDelete("{blobName}")]
        public async Task<IActionResult> DeleteFileAsync(string blobName)
        {
            await _blobService.DeleteBlobAsync(blobName);
            return Ok();
        }
    }
}
