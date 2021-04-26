namespace WingtipToys.Data.Migrations
{
    using System.Data.Entity.Migrations;
    using WingtipToys.Data.ModelsCodeFirst;

    internal sealed class Configuration : DbMigrationsConfiguration<WingtipModelCodeFirst>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(WingtipModelCodeFirst context)
        {
        }
    }
}
