using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Business;
using WingtipToys.Data;
using WingtipToys.Data.Models;

namespace WingtipToys
{
    public partial class ProductCreate : System.Web.UI.Page
    {
        static readonly HttpClient client = new HttpClient();
        private static readonly IStoreService _service = new StoreService(new InMemoryProductRepository(), new InMemoryCategoryRepository());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Category> GetCategories()
        {
            return _service.GetAllCategories().AsQueryable();
        }

        protected void ValidationImageUrl(object source, ServerValidateEventArgs args)
        {

        }

        protected override void OnPreRender(EventArgs e)
        {
            if (IsPostBack && IsValid)
            {
                CreateProductForm.Visible = false;
                SuccessBlock.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var product = new Product
                {
                    ProductName = Name.Text,
                    Description = Description.Value
                };
                var created = _service.CreateProduct(product);
            }
        }
    }
}