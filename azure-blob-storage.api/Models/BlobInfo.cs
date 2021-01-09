using System;
using System.IO;

namespace azure_blob_storage.api.Models
{
    public class BlobInfo
    {
        private BlobInfo(Stream content, string contentType)
        {
            Content = content ?? throw new ArgumentNullException(nameof(content));
            ContentType = contentType ?? throw new ArgumentNullException(nameof(contentType));
        }

        public static BlobInfo CreateInstance(Stream content, string contentType)
            => new BlobInfo(content, contentType);

        public Stream Content { get; }
        public string ContentType { get; }
    }
}
