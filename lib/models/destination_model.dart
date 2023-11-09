import 'package:aboncoffee/models/activity_model.dart';

class Destination {
  String imageUrl;
  
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/clubkavi.jpg',
    name: 'Клуб кави',
    desc: "Клуб кавы – это новый формат отдыха для тех, кто ценит спокойствие уют, и европейский уровень обслуживания. Здесь нет плохо обслуживающих официантов, невкусно приготовленной еды, лишней суеты, шума и пафоса. Лаконичный интерьер, удобная мебель, стильное оформление помещения, приятная музыка в зале – все способствует умиротворению клиента, дает возможность по-настоящему отдохнуть. Кулинарная философия Классические рецепты этих блюд играют новыми вкусами благодаря опыту и таланту шеф-повара. Находясь в самом сердце столицы это заведение показывает высокий уровень качества при демократичной ценовой политике. Это идеальное место для романтического свидания, делового ужина, бизнес-переговоров. В Клуб каве нет ничего лишнего – все гармонично подобрано и со вкусом. Приходите в гости – и вы не пожалеете о своем выборе.",
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 pm'],
    rating: 4.8,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/verandacoffee.jpg',
    //name: 'Veranda\n Coffee',
    name: 'Веранда',
    desc: "Веранда кава – это новый формат отдыха для тех, кто ценит спокойствие уют, и европейский уровень обслуживания. Здесь нет плохо обслуживающих официантов, невкусно приготовленной еды, лишней суеты, шума и пафоса. Лаконичный интерьер, удобная мебель, стильное оформление помещения, приятная музыка в зале – все способствует умиротворению клиента, дает возможность по-настоящему отдохнуть. Кулинарная философия Классические рецепты этих блюд играют новыми вкусами благодаря опыту и таланту шеф-повара. Находясь в самом сердце столицы это заведение показывает высокий уровень качества при демократичной ценовой политике. Это идеальное место для романтического свидания, делового ужина, бизнес-переговоров. В Клуб каве нет ничего лишнего – все гармонично подобрано и со вкусом. Приходите в гости – и вы не пожалеете о своем выборе.",
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 pm'],
    rating: 4.2,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/magiccoffee.jpg',
    //name: 'Magic\n coffee',
    name: 'Магія кави',
    desc: "Магия кавы – это новый формат отдыха для тех, кто ценит спокойствие уют, и европейский уровень обслуживания. Здесь нет плохо обслуживающих официантов, невкусно приготовленной еды, лишней суеты, шума и пафоса. Лаконичный интерьер, удобная мебель, стильное оформление помещения, приятная музыка в зале – все способствует умиротворению клиента, дает возможность по-настоящему отдохнуть. Кулинарная философия Классические рецепты этих блюд играют новыми вкусами благодаря опыту и таланту шеф-повара. Находясь в самом сердце столицы это заведение показывает высокий уровень качества при демократичной ценовой политике. Это идеальное место для романтического свидания, делового ужина, бизнес-переговоров. В Клуб каве нет ничего лишнего – все гармонично подобрано и со вкусом. Приходите в гости – и вы не пожалеете о своем выборе.",
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 pm'],
    rating: 4.4,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/khmelnitsky.jpg',
    city: 'Хмельницький',
    country: 'Ukraine',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];