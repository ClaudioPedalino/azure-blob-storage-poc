using System.IO;

namespace azure_blob_storage.api.Models
{
    public class BlobInfo
    {
        public Stream Content { get; set; }
        public string ContentType { get; set; }
    }
}
