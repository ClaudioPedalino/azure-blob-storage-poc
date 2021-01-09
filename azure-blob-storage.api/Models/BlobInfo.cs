using System;
using System.IO;

namespace azure_blob_storage.api.Models
{
    public class BlobInfo
    {
        public static BlobInfo CreateInstance(Stream content, string contentType)
        {
            if (content == null) throw new ArgumentNullException(nameof(content));
            if (contentType == null) throw new ArgumentNullException(nameof(contentType));

            var instance = new BlobInfo { Content = content, ContentType = contentType };

            return instance;
        }

        public Stream Content { get; private init; }
        public string ContentType { get; private init; }
    }
}
