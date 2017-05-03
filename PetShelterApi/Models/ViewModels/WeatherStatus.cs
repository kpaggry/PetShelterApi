namespace PetShelterApi.Models.ViewModels
{
    public class WeatherStatus
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string TimeZone { get; set; }
        public Status Currently { get; set; }
    }

    public class Status
    {
        public string Time { get; set; }
        public string Summary { get; set; }
        public string Icon { get; set; }
    }
}
