USERS = [
  {
    first_name: "Nathan",
    last_name: "Allen",
    email: "NathanAllen@WDI30.com",
    password_digest:  "",
    image: "https://cdn0.vox-cdn.com/images/verge/default-avatar.v9899025.gif"
  },
  {
    first_name: "Justin",
    last_name: "Castilla",
    email: "JustinCastilla@WDI30.com",
    password_digest:  "",
    image: "https://cdn0.vox-cdn.com/images/verge/default-avatar.v9899025.gif"
  },
  {
    first_name: "Ben",
    last_name: "Manning",
    email: "BenManning@WDI30.com",
    password_digest:  "",
    image: "https://cdn0.vox-cdn.com/images/verge/default-avatar.v9899025.gif"
  },
  {
    first_name: "Melissa",
    last_name: "Carlson",
    email: "MelissaCarlson@WDI30.com",
    password_digest:  "",
    image: "https://cdn0.vox-cdn.com/images/verge/default-avatar.v9899025.gif"
  }
]

MUNIS = [
  {
    name: "1-California",
    description: "ipsem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    name: "25-Treasure Island",
    description: "ipsem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    name: "38-Geary",
    description: "ipsem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    name: "47-Van Ness",
    description: "ipsem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  }
]

ARTICLES = [
  {
    title: "Crow-M-G!!! Bird flies into Muni bus",
    content: "Muni rider Cynthia had a rather unexpected fellow passenger over the weekend.",
    image: "http://www.munidiaries.com/wp-content/uploads/2016/08/crow.jpg",
    user_id: 1,
    muni_id: 1,
  },
  {
    title: "Roger Rabbit takes the 19-Polk to Toontown",
    content: "I mean, there is a lot of boozing in the movie, so the 19 is probably the perfect route to ride.",
    image: "http://www.munidiaries.com/wp-content/uploads/2016/05/roger_rabbit2.jpg",
    user_id: 1,
    muni_id: 1,
  },
  {
    title: "Poop-cleaning neighbors still need Muni’s help",
    content: "The management at the apartment building at Post and Leavenworth has gone above and beyond in keeping their block nice and not-too-smelly, extending even to the Muni stop in front of the building. But when the Muni stop poop bandit hits your block, it’s just all too much. Here is their PSA sign that doubles as a cry for help.",
    image: "http://www.munidiaries.com/wp-content/uploads/2016/05/muni-poop-cleaning.jpg",
    user_id: 1,
    muni_id: 1,
  },
  {
    title: "Skater eschews pushing, hitches a ride ‘on’ Muni",
    content: "We’ve seen this type of heroics activity before. You know the saying: If Marty McFly can do it …",
    image: "http://www.munidiaries.com/wp-content/uploads/2016/02/skater.jpg",
    user_id: 1,
    muni_id: 1,
  }
]

COMMENTS = [
  {
    vote: 1,
    user_id: 1,
    article_id: 1
  },
  {
    vote: -1,
    user_id: 2,
    article_id: 1
  },
  {
    vote: 0,
    user_id: 3,
    article_id: 1
  },
  {
    vote: 1,
    user_id: 4,
    article_id: 1
  },
]


User.create(USERS)
Muni.create(MUNIS)
Article.create(ARTICLES)
Comment.create(COMMENTS)
