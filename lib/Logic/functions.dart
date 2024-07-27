import 'package:intl/intl.dart';

String getAnimation(String condition, int isDay) {
  const assets = "assets/lottie";

  switch ('$condition|$isDay') {
    case const ('sunny|1'):
      return '$assets/clear-day.json';
    case const ('clear|1'):
      return '$assets/clear-day.json';
    case 'clear|0':
      return '$assets/clear-night.json';
    case 'partly cloudy|1':
      return '$assets/partly-cloudy-day.json';
    case 'partly cloudy|0':
      return '$assets/partly-cloudy-night.json';
    case 'fog|1':
      return '$assets/fog-day.json';
    case 'fog|0':
      return '$assets/fog-night.json';
    case const ('overcast|1'):
      return '$assets/overcast.json';
    case const ('overcast|0'):
      return '$assets/overcast.json';
    case const ('mist|1'):
      return '$assets/mist.json';
    case const ('mist|0'):
      return '$assets/mist.json';
    case const ('patchy rain nearby|1'):
      return '$assets/partly-cloudy-day-rain.json';
    case const ('patchy rain nearby|0'):
      return '$assets/partly-cloudy-night-rain.json';
    case const ('patchy snow nearby|1'):
      return '$assets/partly-cloudy-day-snow.json.json';
    case const ('patchy snow nearby|0'):
      return '$assets/partly-cloudy-night-snow.json';
    case 'patchy sleet nearby|1':
      return '$assets/partly-cloudy-day-sleet.json';
    case 'patchy sleet nearby|0':
      return '$assets/partly-cloudy-night-sleet.json';
    case 'patchy freezing drizzle nearby|1':
      return '$assets/partly-cloudy-day-drizzle.json';
    case 'patchy freezing drizzle nearby|0':
      return '$assets/partly-cloudy-night-drizzle.json';
    case const ('thundery outbreaks nearby|1'):
      return '$assets/thunderstorms-day-extreme.json';
    case const ('thundery outbreaks nearby|0'):
      return '$assets/thunderstorms-night-extreme.json';
    case const ('blowing snow|1'):
      return '$assets/snow.json';
    case const ('blowing snow|0'):
      return '$assets/snow.json';
    case const ('freezing fog|1'):
      return '$assets/fog.json';
    case const ('freezing fog|0'):
      return '$assets/fog.json';
    case const ('patchy light drizzle|1'):
      return '$assets/partly-cloudy-day-drizzle.json';
    case const ('patchy light drizzle|0'):
      return '$assets/partly-cloudy-night-drizzle.json';
    case const ('light drizzle|1'):
      return '$assets/partly-cloudy-day-drizzle.json';
    case 'light drizzle|0':
      return '$assets/partly-cloudy-night-drizzle.json';
    case 'freezing drizzle|1':
      return '$assets/drizzle.json';
    case 'freezing drizzle|0':
      return '$assets/drizzle.json';
    case 'heavy freezing drizzle|1':
      return '$assets/extreme-drizzle.json';
    case 'heavy freezing drizzle|0':
      return '$assets/extreme-drizzle.json';
    case const ('patchy light rain|1'):
      return '$assets/partly-cloudy-day-rain.json';
    case const ('patchy light rain|0'):
      return '$assets/partly-cloudy-night-rain.json';
    case const ('light rain|1'):
      return '$assets/rain.json';
    case const ('light rain|0'):
      return '$assets/rain.json';
    case const ('moderate rain at times|1'):
      return '$assets/partly-cloudy-day-rain.json';
    case const ('moderate rain at times|0'):
      return '$assets/partly-cloudy-night-rain.json';
    case const ('moderate rain|1'):
      return '$assets/rain.json';
    case const ('moderate rain|0'):
      return '$assets/rain.json';
    case 'heavy rain at times|1':
      return '$assets/extreme-day-rain.json';
    case 'heavy rain at times|0':
      return '$assets/extreme-night-rain.json';
    case 'heavy rain|1':
      return '$assets/extreme-rain.json';
    case 'heavy rain|0':
      return '$assets/extreme-rain.json';
    case const ('light freezing rain|1'):
      return '$assets/rain.json';
    case const ('light freezing rain|0'):
      return '$assets/rain.json';
    case const ('moderate or heavy freezing rain|1'):
      return '$assets/extreme-rain.json';
    case const ('moderate or heavy freezing rain|0'):
      return '$assets/extreme-rain.json';
    case const ('light sleet|1'):
      return '$assets/sleet.json';
    case const ('light sleet|0'):
      return '$assets/sleet.json';
    case const ('moderate or heavy sleet|1'):
      return '$assets/extreme-sleet.json';
    case const ('moderate or heavy sleet|0'):
      return '$assets/extreme-sleet.json';
    case const ('patchy light snow|1'):
      return '$assets/partly-cloudy-day-snow.json';
    case const ('patchy light snow|0'):
      return '$assets/partly-cloudy-night-snow.json';
    case const ('light snow|1'):
      return '$assets/snow.json';
    case const ('light snow|0'):
      return '$assets/snow.json';
    case const ('patchy moderate snow|1'):
      return '$assets/partly-cloudy-day-snow.json';
    case const ('patchy moderate snow|0'):
      return '$assets/partly-cloudy-night-snow.json';
    case const ('moderate snow|1'):
      return '$assets/snow.json';
    case const ('moderate snow|0'):
      return '$assets/snow.json';
    case const ('heavy snow|1'):
      return '$assets/extreme-snow.json';
    case const ('heavy snow|0'):
      return '$assets/extreme-snow.json';
    case const ('ice pellets|1'):
      return '$assets/hail.json';
    case const ('ice pellets|0'):
      return '$assets/hail.json';
    case const ('light showers of ice pellets|1'):
      return '$assets/overcast-day-hail.json';
    case const ('light showers of ice pellets|0'):
      return '$assets/overcast-day-hail.json';
    case const ('moderate or heavy showers of ice pellets|1'):
      return '$assets/extreme-day-hail.json';
    case const ('moderate or heavy showers of ice pellets|0'):
      return '$assets/extreme-night-hail.json';
    case const ('light rain shower|1'):
      return '$assets/partly-cloudy-day-rain.json';
    case const ('light rain shower|0'):
      return '$assets/partly-cloudy-night-rain.json';
    case const ('moderate or heavy rain shower|1'):
      return '$assets/overcast-day-rain.json';
    case const ('moderate or heavy rain shower|0'):
      return '$assets/overcast-night-rain.json';
    case const ('torrential rain shower|1'):
      return '$assets/extreme-day-rain.json';
    case const ('torrential rain shower|0'):
      return '$assets/extreme-night-rain.json';
    case const ('light sleet showers|1'):
      return '$assets/extreme-day-hail.json';
    case const ('light sleet showers|0'):
      return '$assets/extreme-night-hail.json';
    case const ('moderate or heavy sleet showers|1'):
      return '$assets/partly-cloudy-day-rain.json';
    case const ('moderate or heavy sleet showers|0'):
      return '$assets/partly-cloudy-night-rain.json';
    case const ('light snow showers|1'):
      return '$assets/partly-cloudy-day-snow.json';
    case const ('light snow showers|0'):
      return '$assets/partly-cloudy-day-snow.json';
    case const ('moderate or heavy snow showers|1'):
      return '$assets/extreme-day-snow.json';
    case const ('moderate or heavy snow showers|0'):
      return '$assets/extreme-night-snow.json';
    case const ('patchy light rain with thunder|1'):
      return '$assets/thunderstorms-day-rain.json';
    case const ('patchy light rain with thunder|0'):
      return '$assets/thunderstorms-night-rain.json';
    case const ('moderate or heavy rain with thunder|1'):
      return '$assets/thunderstorms-day-extreme-rain.json';
    case const ('moderate or heavy rain with thunder|0'):
      return '$assets/thunderstorms-night-extreme-rain.json';
    case const ('patchy light snow with thunder|1'):
      return '$assets/thunderstorms-day-snow.json';
    case const ('patchy light snow with thunder|0'):
      return '$assets/thunderstorms-day-snow.json';
    case const ('moderate or heavy snow with thunder|1'):
      return '$assets/thunderstorms-night-extreme-snow.json';
    case const ('moderate or heavy snow with thunder|0'):
      return '$assets/thunderstorms-night-extreme-snow.json';
    default:
      return '$assets/not-available.json';
  }
}

int dateComparer(String time) {
  return (DateFormat('Hm').format(DateTime.now()))
      .compareTo(DateFormat.Hm().format(DateFormat("hh:mm").parse(time)));
}
