Admin.create!([
  {email: "123arjunsuresh@gmail.com", name: "Arjun Suresh", pass: "trilon258"}
])
Auction.create!([
  {admin_id: 30, status: "None", pid: 7, start_time: "2017-09-22 18:00:00", end_time: "2017-09-25 21:07:00"}
])
Auction_item.create!([
  {auction_id: 12, prod_id: 7, winner_id: 30, bid_val: "26200.0"},
  {auction_id: 12, prod_id: 7, winner_id: 30, bid_val: "26200.0"},
  {auction_id: 12, prod_id: 7, winner_id: 30, bid_val: "26200.0"}
])
Bidding_table.create!([
  {auction_id: 7, prod_id: 11, time: "2017-09-23 13:26:58 +0530", biding_price: 999999999.0, bidder_id: 30},
  {auction_id: 7, prod_id: 11, time: "2017-09-23 15:55:26 +0530", biding_price: 9999999999999.0, bidder_id: 30},
  {auction_id: 10, prod_id: 13, time: "2017-09-23 21:01:21 +0530", biding_price: 50000.0, bidder_id: 30},
  {auction_id: 10, prod_id: 13, time: "2017-09-23 21:03:55 +0530", biding_price: 50001.0, bidder_id: 30},
  {auction_id: 12, prod_id: 7, time: "2017-09-23 21:11:13 +0530", biding_price: 26000.0, bidder_id: 30},
  {auction_id: 12, prod_id: 7, time: "2017-09-23 21:11:19 +0530", biding_price: 26010.0, bidder_id: 30},
  {auction_id: 12, prod_id: 7, time: "2017-09-23 21:11:35 +0530", biding_price: 26200.0, bidder_id: 30}
])
Category.create!([
  {name: "Electronics"},
  {name: "Toys"}
])
Product.create!([
  {category: nil, description: "sgdfdfgdfgdfg", name: "asdsafsdf", image: "/uploads/1587484157xiaomi-mix-.jpg", min_bid: 25600.0, seller_id: 30, auction_status: "WINNER_DECLARED", verified_by: 1, auction_id: 12, start_time: "2017-09-23 18:00:00", end_time: "2017-09-25 21:07:00"},
  {category: nil, description: "Car is for rich  person. ", name: "Lamborgini Galardo", image: "/uploads/7619746102012-Lamborghini-Gallardo-Trofeo-Stradale-Front-Quarter.jpg", min_bid: 6600000.0, seller_id: 30, auction_status: "None", verified_by: -1, auction_id: 12, start_time: "2017-09-30 19:00:00", end_time: "2017-10-12 20:00:00"},
  {category: nil, description: "SSFDGDSGSFDGetfdghfj", name: "Furniture Chair", image: "/uploads/3279593777furniture.jpeg", min_bid: 35600.0, seller_id: 30, auction_status: "None", verified_by: 1, auction_id: nil, start_time: nil, end_time: nil},
  {category: nil, description: "Good Condition ,HP Pavellion 15", name: "Laptop", image: "/uploads/130413444c05494889.png", min_bid: 20000.0, seller_id: 30, auction_status: "VERIFY_AUCTION", verified_by: -1, auction_id: nil, start_time: "2017-10-10 12:50:00", end_time: "2017-10-19 12:50:00"},
  {category: "", description: "askdhahfahjdhiuh", name: "nkojnm", image: "/uploads/83242234116712011_1233862760025071_5503894258318613670_n.jpg", min_bid: 256220.0, seller_id: 30, auction_status: "SCHEDULED", verified_by: -1, auction_id: nil, start_time: "2017-09-30 18:24:00", end_time: "2017-10-11 18:24:00"},
  {category: "", description: "Good TV .HD 3D ", name: "SONY BRAVIA TV LED Curved", image: "/uploads/958211048asi-rmt-CurvedMonitorBeachInsetTabBeachInset-708-TVHTPFS-071116 - Copy.jpeg", min_bid: 45000.0, seller_id: 30, auction_status: "AUCTION_LIVE", verified_by: -1, auction_id: 10, start_time: "2017-09-23 16:49:00", end_time: "2017-09-23 20:00:00"}
])
User.create!([
  {name: "reshasdhaiufh", addr: "sadgfsdfgfdsxzg", gender: "Female", usertype: "User", email: "123sadfsgsfd@gmail.com", phno: "1234567890", verified_by: 1, pwd: "7da48f5def93ea7b66d8a03299789909c2eca2eb", salt: "43504"},
  {name: "ArjunSuresh", addr: "muthiraparambildsdsfgfdgfdgdfg", gender: "Male", usertype: "admin", email: "123arjunsuresh@gmail.com", phno: "9495889419", verified_by: -1, pwd: "7da48f5def93ea7b66d8a03299789909c2eca2eb", salt: "43504"},
  {name: "ShivaniKarnewar", addr: "asdlhsdkjlfhsdkhfusdhfuilhsdfluisdhf", gender: nil, usertype: "user", email: "shinukarnewar@gmail.com", phno: "1234567890", verified_by: -1, pwd: "61784dcc8d5f4611da7351c5baee579d6d95a139", salt: "43202"}
])
Verify.create!([
  {userid: 6, code: "9222ed849d2ff93007001f3f4dee999e4e435aa8", date: "2017-09-21 19:55:40", expired: 0},
  {userid: 7, code: "6d591da7a5f01b755c76df9b54e118f14386879b", date: "2017-09-21 20:02:03", expired: 0},
  {userid: 8, code: "ff307d24fdbb3d3db2d91bedb331d2761cf275d8", date: "2017-09-21 20:03:30", expired: 0},
  {userid: 9, code: "1b65da45a619d463afb87da2fc0ad56f461cc3d4", date: "2017-09-21 20:13:13", expired: 0},
  {userid: 10, code: "859e676ed0190211bd422a276a034e769cbbf37c", date: "2017-09-21 20:29:41", expired: 0},
  {userid: 11, code: "46c11ea0b779b005db1a58ac14202a644e6639d8", date: "2017-09-21 20:33:23", expired: 0},
  {userid: 12, code: "144475a61e8f4d554971cc11bc4a2b312ff969b4", date: "2017-09-21 20:43:09", expired: 0},
  {userid: 13, code: "747ff342594942f4c9a5b48f3cd9f7d13b1e0d29", date: "2017-09-21 21:06:12", expired: 1},
  {userid: 14, code: "9aa37cb92a5f14fefad761255a0fe04765b9f614", date: "2017-09-22 08:49:02", expired: 1},
  {userid: 15, code: "9e21a883a48b3c1529f16b64fbf697fcc47ab6ca", date: "2017-09-22 10:25:56", expired: 0},
  {userid: 16, code: "86b47d3dc000e26d95106355f98989c2869344e6", date: "2017-09-22 10:28:49", expired: 0},
  {userid: 17, code: "1a6ac8142c38a1f258668cf3a689c71a601b780b", date: "2017-09-22 10:31:08", expired: 0},
  {userid: 18, code: "8325a2609f7f20bbf0fac06e5b55a2a3f484f489", date: "2017-09-22 10:33:47", expired: 0},
  {userid: 19, code: "02c49dc96ca5016f85c3e2369b0ed4b719866989", date: "2017-09-22 11:07:56", expired: 0},
  {userid: 20, code: "4472057e6c0b74a9026eec87501fa6a819f117d1", date: "2017-09-22 11:08:54", expired: 0},
  {userid: 21, code: "10af641ebaf8b842d1ddd1093ebcf86fe9e3dda8", date: "2017-09-22 11:17:55", expired: 0},
  {userid: 22, code: "4fa7af21898c837bf77f487a8d7e8c9599cccc81", date: "2017-09-22 11:20:44", expired: 0},
  {userid: 23, code: "c2387d1fa2cf4d9de1c8e388108e5f6816dc8827", date: "2017-09-22 11:38:26", expired: 0},
  {userid: 24, code: "054ccce06c814d06b604960954726735fd629ec1", date: "2017-09-22 11:41:21", expired: 0},
  {userid: 25, code: "4dd6d288a6f4887f494ceb30fed271fe72beb057", date: "2017-09-22 11:46:16", expired: 0},
  {userid: 26, code: "c5fc1dc196af5f3e8385b20c68329f091c68f2fe", date: "2017-09-22 15:17:24", expired: 0},
  {userid: 27, code: "371497fc96d2ba4defb140eb416388f5af798c29", date: "2017-09-22 16:15:31", expired: 0},
  {userid: 28, code: "90c0a93b35187d3ef000b635cd9d4d8ee1e0ecef", date: "2017-09-22 16:17:16", expired: 1},
  {userid: 30, code: "cb5a1e8246cc8230dc6ab7822d5bbe455e89c0dd", date: "2017-09-23 06:25:30", expired: 1},
  {userid: 33, code: "6ec9f9b2242450f2d575a09601d1bc02433beef0", date: "2017-09-25 07:54:57", expired: 1}
])
