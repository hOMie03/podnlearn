using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PodnLearn
{
    public class Podcast
    {
        public string PodcastName { get; set; }
        public string ThumbnailPath { get; set; }
        public string EpisodeNumber { get; set; }
        public string EpisodeName { get; set; }
    }
}