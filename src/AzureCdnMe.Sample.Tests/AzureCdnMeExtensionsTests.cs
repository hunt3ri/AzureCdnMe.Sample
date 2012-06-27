using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using System.Web.Mvc;
using Moq;
using System.Web;
using System.Web.Routing;
using AzureCdnMe.Sample.Code.Extensions;

namespace AzureCdnMe.Sample.Tests
{
    [TestFixture]
    public class AzureCdnMeExtensionsTests
    {
        [Test]
        public void If_CDN_EndPoint_Does_Not_Start_Http_Then_Insert_Folder_Appropriately()
        {
            // Arrange
            AzureCDNMeExtensions.CdnAddress = "CDN";

            // Act
            var cdnUrl = AzureCDNMeExtensions.FormatContentLocation("~/Content/bootstrap.css", "?version=1.0.0.0");

            //Assert
            Assert.That(cdnUrl, Is.EqualTo("~/CDN/Content/bootstrap.css?version=1.0.0.0"));

           
        }
    }
}
