using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Data.Models;
using WingtipToys.Business;
using WingtipToys.Data;



namespace WingtipToys
{
    public partial class ProductDetails : System.Web.UI.Page

    {
        private static readonly IStoreService _service = new StoreService(new InMemoryProductRepository(), new InMemoryCategoryRepository());
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Product> GetProduct([RouteData("productId")] int? productId)
        {
            if (!productId.HasValue || productId.Value == 0)
            {
                return null;
            }
            return new List<Product>(1) { _service.GetProduct(productId.Value) }.AsQueryable();
        }


    }


}