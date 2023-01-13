INSERT INTO trays (size, trayName, hashID)
VALUES  (24, 'Molina', 'c1413613314bcfb83ff97aec563afc7d'),
        (24, 'Herrero', 'a83cbc2bee44057d1f659925b260457a'),
        (24, 'Blesa', '73fc2eb4abb47f532f54cd096b3fc8b2'),
        (24, 'Gallardo', '4836e7cde92389558a7afd0f3362559e'),
        (24, 'Aguilar', '3bdf7a5837fe585f27713efacc72b201'),
        (24, 'Rubio', '15d1080e94707390ea9bf762f87c888f'),
        (24, 'Bravo', '2da8b51fe60c4a75d6a6d1bdc2c28781'),
        (24, 'Cruz', 'ac9cbad076e4f9d969fef4aab79698fa'),
        (24, 'Lorenzo', 'cc8aff471357ea13c7cc18946a34241b'),
        (24, 'Ferrer', '9bb351675b7e8c9ed5ef1475a468a41c'),
        (24, 'Vargas', '5c73b66faecf6186dced82533d95e9f4'),
        (24, 'Ruiz', '04dccd2c02fcb910a56c1c20bd1542c1'),
        (24, 'Herrera', 'fb5f58d9e64f86f3d3d81e8fcdb5b75b'),
        (24, 'Guerrero', 'bef90762eca2a777abd8a6e5ae6626bd'),
        (24, 'Ramos', 'd96003581165b15091cc292d977b56fc'),
        (24, 'Mora', '68246671e02399f5897a715367fecab3'),
        (24, 'Castro', '1708c27caa56c8e7630b46341f4d0a84');

INSERT INTO batches (varietyID, trayID, qtyPlanted, qtyGerminated, sewnDate, germinatedDate, hashID, activeStatus)
VALUES  (1,1,12,7,'2023-01-12 14:43:12','2023-02-05 12:04:23','731291aad18c7f622ab2dedb26dd9c9b', 0),
        (2,1,12,5,'2023-01-12 14:49:11','2023-01-30 20:30:18','66a553d3362783ef32cd4520e7010e0e', 0),
        (3,2,12,3,'2023-01-12 14:59:23','2023-02-13 01:07:37','cd148edf91003ea4d82d675bd08b0558', 0),
        (4,2,12,11,'2023-01-12 15:03:41','2023-02-02 19:53:14','4d939b045d42b2f33ada1b9581db6436', 0),
        (5,3,12,9,'2023-01-12 15:07:27','2023-01-27 14:59:55','a4312362c8ab91925f30bd1f9628d9e5', 0),
        (6,3,12,10,'2023-01-12 15:19:17','2023-01-28 00:02:10','80eb1ab6891c1312b27548d871748cb8', 0),
        (1,4,12,6,'2023-01-23 11:10:12','2023-02-28 06:22:46','731291aad18c7f622ab2dedb26dd9c9b', 1),
        (2,4,12,12,'2023-01-23 11:23:16','2023-02-10 23:01:22','66a553d3362783ef32cd4520e7010e0e', 1),
        (3,5,8,7,'2023-01-23 11:30:23','2023-02-12 07:30:22','cd148edf91003ea4d82d675bd08b0558', 1),
        (4,5,12,8,'2023-01-23 12:06:45','2023-02-21 12:33:07','4d939b045d42b2f33ada1b9581db6436', 1),
        (5,6,7,11,'2023-01-23 12:12:23','2023-02-19 06:35:46','a4312362c8ab91925f30bd1f9628d9e5', 1),
        (6,6,12,3,'2023-01-23 12:27:16','2023-02-24 00:01:07','80eb1ab6891c1312b27548d871748cb8', 1);

INSERT INTO batchComments (batchID, batchComment, createdDate)
VALUES  (1, '5 extra seeds in the packet, bonus!  Used potting soil.', '2023-01-12 14:47:12'),
        (2, 'Seeds look a bit odd.  Used potting soil.', '2023-01-12 14:52:12'),
        (3, 'Used potting soil.', '2023-01-12 15:01:12'),
        (4, '3 too few seeds in pack :(  Used potting soil.', '2023-01-12 15:04:12'),
        (5, 'Cat attack!  Hope we not lost any seeds.', '2023-01-12 15:10:12'),
        (6, 'Used potting soil.', '2023-01-12 15:25:12'),
        (7, 'First of the second round of planting. All smooth.  Potting soil.' '2023-01-23 11:12:15'),
        (8, 'Potting soil. Some wastage.' '2023-01-23 11:25:15'),
        (9, 'Potting soil. All seeds used up - only 8 of planned 12 planted.' '2023-01-23 11:34:15'),
        (10, 'Potting soil. All good, nothing to see here.' '2023-01-23 12:10:15'),
        (11, 'USed potting soil again, 7 of 12 planted.  Run out of seeds.','2023-01-23 12:15:15' ),
        (12, 'Last of potting soil used up.  Possibly too little in some pots.', '2023-01-23 12:34:16');



        

        