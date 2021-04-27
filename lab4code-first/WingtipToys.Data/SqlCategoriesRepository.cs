﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WingtipToys.Data.ModelsCodeFirst;

namespace WingtipToys.Data
{
    public class SqlCategoryRepository : ICategoryRepository
    {
        public Category Create(Category category)
        {
            using (var ctx = new WingtipModelCodeFirst())
            {
                var added = ctx.Categories.Add(category);
                ctx.SaveChanges();
                return added;
            }
        }
        public Category Update(Category category)
        {
            using (var ctx = new WingtipModelCodeFirst())
            {
                var existing = ctx.Categories.SingleOrDefault(x => x.CategoryID == category.CategoryID);
                if (existing == null)
                {
                    return null;
                }
                existing.Description = category.Description;
                existing.CategoryName = category.CategoryName;
                ctx.SaveChanges();
                return existing;
            }
        }

        public bool Delete(int categoryId)
        {
            using (var ctx = new WingtipModelCodeFirst())
            {
                var existing = ctx.Categories.SingleOrDefault(x => x.CategoryID == categoryId);
                if (existing == null)
                {
                    return false;
                }
                ctx.Categories.Remove(existing);
                ctx.SaveChanges();
                return true;
            }
        }
        public Category Get(int categoryId)
        {
            using (var ctx = new WingtipModelCodeFirst())
            {
                return ctx.Categories.SingleOrDefault(x => x.CategoryID == categoryId);
            }
        }

        public Category Get(string categoryName)
        {
            using (var ctx = new WingtipModelCodeFirst())
            {
                return ctx.Categories.SingleOrDefault(x => x.CategoryName.Equals(categoryName, StringComparison.InvariantCultureIgnoreCase));
            }
        }

        public IEnumerable<Category> GetAll()
        {
            using (var ctx = new WingtipModelCodeFirst())
            {
                return ctx.Categories.ToList();
            }
        }

    }

}
