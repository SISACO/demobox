import 'package:donobox/model/model.dart';
import 'package:flutter/material.dart';

List<NewPost> newpostlist = [
  NewPost(
    id: 0,
    img : imglist[0],
    slogan: 'Help Them Smile Again', 
    fund: "\u{20B9}1000",
    des: 'We work in close coordination with government agencies at various levels – National, State and District – to run child welfare projects. We work with the aim to support and contribute towards Government of India’s vision to build a “Bharat” where children are well-nurtured, with full opportunities for growth and development in a safe and protective environment.Presently, we have presence across 15 states and 3 Union Territories of India and have impacted the lives of more than 10 million children since 2008.We urge you to play your part in gifting a meaningful childhood to underprivileged children. Through your contributions, we can reach more children and support their various needs.'),
  
  NewPost(
    id: 1, 
    img:imglist[1],
    slogan: 'Peace begins with a smile.', 
    fund: "\u{20B9}2000",
    des: 'The mission of the i-Care Foundation is to improve the quality of life of underprivileged Pakistanis by enhancing the level of philanthropic support to local charities and by working with them to improve their capacity to deliver more, with greater impact.Our vision includes collaborating with organizations that can help to bring about positive change in the lives of marginalized and vulnerable communities. i-care America’s EIN/Federal tax identification number 262437362.'),
  NewPost(
    id: 2, 
    img:imglist[2],
    slogan: 'Empower Dreams, Change Lives!',
    fund: "\u{20B9}1500", 
    des: 'This charity initiative focuses on providing education and vocational training to underprivileged children and young adults, unlocking their potential and empowering them to break the cycle of poverty. Your support helps create a brighter future, one where dreams are realized and lives are transformed through the gift of education.'),
  NewPost(
    id: 3, 
    img:imglist[3],
    slogan: 'Healing Hearts, Restoring Hope', 
    fund: '"\u{20B9}500"',
    des: 'TJoin us in supporting a charity dedicated to providing medical aid and mental health services to communities affected by disasters, conflicts, or poverty. By contributing to this cause, you become a vital part of the effort to heal hearts and restore hope, bringing relief and comfort to those facing physical and emotional challenges.'),
  NewPost(
    id: 4, 
    img:imglist[4],
    slogan: 'Greening the Globe, Sustaining Life!', 
    fund: "\u{20B9}600",
    des: 'This environmental charity initiative is committed to promoting sustainability and combating climate change. By planting trees, promoting eco-friendly practices, and supporting conservation projects, we work together to ensure a healthier planet for current and future generations. Join the movement to green the globe and sustain life for a more sustainable and resilient world.'),
  NewPost(
    id: 5, 
    img:imglist[5],
    slogan: 'Feeding Hope, Nourishing Futures!', 
    fund: "\u{20B9}1200",
    des: 'This charity campaign focuses on eradicating hunger by providing nutritious meals to those in need, especially in impoverished communities. Your support ensures that no one goes to bed hungry and helps create a future where individuals can thrive with the energy and nourishment they need. Join us in feeding hope and nourishing futures for a world where everyone has access to the basic necessity of food.')

];

List imglist = [
  Image.asset('assets/images/test.jpg'),
  Image.asset('assets/images/1.jpg'),
  Image.asset('assets/images/2.jpg'),
  Image.asset('assets/images/3.jpg'),
  Image.asset('assets/images/4.jpg'),
  Image.asset('assets/images/5.jpg'),
];