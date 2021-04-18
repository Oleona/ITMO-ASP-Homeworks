using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Data.Models;
using WingtipToys.Business;
using WingtipToys.Data;

namespace WingtipToys
{
    public partial class CategoryCreate : System.Web.UI.Page
    {
        private static readonly IStoreService _service = new StoreService(new InMemoryProductRepository(), new InMemoryCategoryRepository());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var category = new Category
                {
                    CategoryName = Name.Text,
                    Description = Description.Value
                };
                var created = _service.CreateCategory(category);
                MesageCategoryName.Text = created.CategoryName;
            }
        }
        protected void ValidateUnique(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !_service.CategoryExists(args.Value);
        }
        protected override void OnPreRender(EventArgs e)
        {
            if (IsPostBack && IsValid)
            {
                // CreateProductForm.Visible = false;
                CreateCategoryForm.Visible = false;
                SuccessBlock.Visible = true;
            }
        }
    }
}