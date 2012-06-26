using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.Mvc;

namespace AzureCdnMe.Sample.Code.Extensions
{
	public static class AzureCDNMeExtensions
	{
		/// <summary>
		/// Creates a URL pointing to the appropriate Azure CDN, includes a version number on query string to invalidate cache.
		/// </summary>
		/// <param name="helper">The helper.</param>
		/// <param name="resource">The resource.</param>
		/// <returns></returns>
		public static string AzureCdnContent(this UrlHelper helper, string resource)
		{
			string versionNum = Assembly.GetExecutingAssembly().GetName().Version.ToString();

			var resourceUrl = string.Format("{0}/Content/{1}?version={2}",
											ConfigurationManager.AppSettings["AzureCDNEndpoint"],
											resource,
											versionNum);

			return helper.Content(resourceUrl);
		}

		public static string AzureCdnContent(this UrlHelper helper, string resource, bool randomQueryString)
		{
			var random = new Random().Next().ToString();

			var resourceUrl = string.Format("{0}/Content/{1}?version={2}",
											ConfigurationManager.AppSettings["AzureCDNEndpoint"],
											resource,
											random);

			return helper.Content(resourceUrl);
		}

		private static string FormatResource(string resource)
		{
			var token = new char[] {'/'};

//			var resourceArray = 
//
//			var cdnAddress = ConfigurationManager.AppSettings["AzureCDNEndpoint"].ToLower();
//
//			if (cdnAddress.StartsWith("http"))

			throw new NotImplementedException();
		}


		/// <summary>
		/// Renders the version number.
		/// </summary>
		/// <returns></returns>
		public static MvcHtmlString RenderVersionNumber(this HtmlHelper helper)
		{
			return new MvcHtmlString(Assembly.GetExecutingAssembly().GetName().Version.ToString());
		}

		public static bool IsInDebugMode(this HtmlHelper helper)
		{
			return false;
		}
	}
}
