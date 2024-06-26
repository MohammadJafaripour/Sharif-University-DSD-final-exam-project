TRUNCATE users, cryptocurrencies, networks, wallets ,brokers,
markets, transactions, wallet_transactions, orders,
trades, users_trades, orderbooks, purchase_lists, sales_lists
CASCADE;

INSERT INTO users(first_name, last_name, email, password, phone_number, address, is_admin, national_code) VALUES 
	('Mahdi', 'Akhi', 'mahdi.akhi@gmail.com', 'Akhi1234', '+989021214455', 'Tehran, Azadi, Sharif', FALSE, 0058764541),
	('Mohammad', 'Jafaripour', 'm.sws@gmail.com', 'MAMAli83', '+989051234567', 'Tehran, Shahrak Gharb, Shafagh', FALSE, 1278905481),
	('Nima', 'Pasha', 'nim.pash@gmail.com', 'Pash222', '+989071434567', 'Tehran, Gisha, Azari', TRUE, 1278542481),
	('Mohi', 'Heidari', 'mohitamiz@gmail.com', 'heidar31', '+9890512310964', 'Isf, Khominishahr', FALSE, 1284605481),
	('Shirin', 'Ghazi', 'asale.lamasab@gmail.com', '54shir', '+989789034567', 'Isf, SepahanShahr', FALSE, 1148905481),
	('Abool', 'Norian', 'reifgh.baz@gmail.com', '43abol21', '+989054321567', 'Isf, Badrood, Mahan', TRUE, 1118905481);
	
INSERT INTO cryptocurrencies (name, total_amount, fixed_amount, fixed_value) VALUES 
	('rial', 10, 8, 7),
	('dodge', 2, 1, 1),
	('teter', 5, 3, 3),
	('notcoin', 4, 2, 2);
	


INSERT INTO networks (wage, name, time, crypto_id) VALUES 
	(5, 'net1', '2020-05-08', 1),
	(2, 'ote', '2023-05-08', 1),
	(10, 'www', '2021-05-08', 1),
	(7, 'zse', '2012-05-08', 2),
	(2, 'netter', '2020-07-08', 2),
	(2, 'tetrax', '2021-05-11', 3),
	(3, 'xbit', '2022-05-12', 3);
	
INSERT INTO wallets (owner_id, crypto_id, free_value, locked_value) VALUES
	(1, 1, 500, 200),
	(1, 2, 100, 50),
	(1, 3, 250, 150),
	(1, 4, 320, 120),
	(2, 2, 500, 200),
	(2, 3, 1000, 100),
	(3, 3, 100, 1000),
	(3, 4, 210, 140),
	(4, 1, 220, 520),
	(4, 3, 310, 270),
	(4, 4, 240, 440),
	(5, 2, 70, 50),
	(6, 1, 80, 60),
	(6, 3, 40, 100);
	
INSERT INTO brokers (name) VALUES
	('alibaba'),
	('coinTrade');
	
INSERT INTO markets (broker_id, base_currency_id, crypto_id, fee, wage) VALUES
	(1, 1, 1, 5, 7),
	(1, 1, 2, 6, 4),
	(1, 1, 3, 3, 8),
	(1, 1, 4, 6, 12),
	(2, 1, 1, 2, 10),
	(2, 1, 2, 1, 3),
	(2, 1, 3, 2, 5);
	
	

INSERT INTO transactions (crypto_id, source_wallet_id, destination_wallet_id, fill, wage, date,market_id) VALUES
	(1, 1, 14, 100, 5, '2020-06-08', 3),
	(1, 2, 13, 200, 6, '2021-08-08', 6),
	(1, 1, 8, 100, 1, '2023-05-08', 7),
	(1, 6, 9, 100, 2, '2023-07-08', 1),
	(1, 6, 10, 100, 1, '2010-06-08', 1),
	(1, 8, 12, 100, 10, '2012-03-08', 2),
	(1, 5, 13, 100, 12, '2020-05-12', 3),
	(1, 7, 13, 100, 5, '2022-05-11', 4),
	(1, 1, 11, 100, 7 ,'2019-06-07', 4),
	(1, 1, 8, 100, 7, '2015-05-03', 7);
	
INSERT INTO wallet_transactions (wallet_id, transaction_id, origin_or_dest) VALUES
	(1, 1, 'origin'),(14, 1, 'dest'),
	(2, 2, 'origin'),(13, 2, 'dest'),
	(1, 3, 'origin'),(8, 3, 'dest'),
	(6, 4, 'origin'),(9, 4, 'dest'),
	(6, 5, 'origin'),(10, 5, 'dest'),
	(8, 6, 'origin'),(12, 6, 'dest'),
	(5, 7, 'origin'),(13, 7, 'dest'),
	(7, 8, 'origin'),(13, 8, 'dest'),
	(1, 9, 'origin'),(11, 9, 'dest'),
	(1, 10, 'origin'),(8, 10, 'dest');
	
	

INSERT INTO purchase_lists (market_id) VALUES
	(1),(2),(3), (4), (5), (6), (7);

INSERT INTO sales_lists (market_id) VALUES
	(1),(2),(3), (4), (5), (6), (7);

INSERT INTO orderbooks (market_id ,list_id) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(5, 5),
	(6, 6),
	(7, 7);
	
INSERT INTO orders (sales_lists_id,purchase_lists_id,is_sell,state,fill,client_id,date,market_id,amount) VALUES
	(1, NULL, TRUE, '', 2, 5, '2020-06-08', 1, 100),
	(1, NULL, TRUE, '', 6, 6, '2021-06-08', 1, 50),
	(3, NULL, TRUE, '', 8, 2, '2021-07-08', 3, 100),
	(5, NULL, TRUE, '', 10, 2, '2023-06-08', 5,70),
	(NULL, 3, FALSE, '', 2, 5, '2012-06-08', 3, 550),
	(NULL, 3, FALSE, '', 3, 1, '2013-06-08', 3, 40),
	(NULL, 1, FALSE, '', 4, 4, '2015-06-08', 1, 100),
	(NULL, 5, FALSE, '', 4, 4, '2017-06-08', 5, 100);
	
	
INSERT INTO trades (date_placed,fill,wage,value,min_fill_remainder,type,list_id,market_id,taker_order_id,maker_order_id,taker_id,maker_id,broker_id,admin_id) VALUES 
	('2021-10-08', 100, 2, 20, 100, 'p2p', 1, 1, 7, 1,4, 5, 1, null),
	('2022-10-08', 40, 3, 20, 40, 'p2p', 3, 3, 6, 3,1, 2, 1, null),
	('2022-11-08', 70, 5, 45, 70, 'p2p', 5, 5, 8, 4,4, 2, 2, null),
	('2022-09-08', 550, 5, 40, 550, 'otc', 3, 3, 5, null,5, null, 1, 3);;
	

INSERT INTO users_trades (trade_id, user_id ) VALUES
	(1, 4), (1, 5),
	(2, 1), (2, 2),
	(3, 4), (3, 2),
	(4, 5), (4, 3);