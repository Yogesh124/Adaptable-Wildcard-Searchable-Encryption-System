-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.45 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for wildcard11
CREATE DATABASE IF NOT EXISTS `wildcard11` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wildcard`;


-- Dumping structure for table wildcard11.enckey
CREATE TABLE IF NOT EXISTS `enckey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` varchar(50) NOT NULL DEFAULT '0',
  `root1` varchar(50) NOT NULL DEFAULT '0',
  `r1s1` varchar(50) NOT NULL DEFAULT '0',
  `r1s2` varchar(50) NOT NULL DEFAULT '0',
  `r1s3` varchar(50) NOT NULL DEFAULT '0',
  `r1s4` varchar(50) NOT NULL DEFAULT '0',
  `root2` varchar(50) NOT NULL DEFAULT '0',
  `r2s1` varchar(50) NOT NULL DEFAULT '0',
  `r2s2` varchar(50) NOT NULL DEFAULT '0',
  `r2s3` varchar(50) NOT NULL DEFAULT '0',
  `r2s4` varchar(50) NOT NULL DEFAULT '0',
  `root3` varchar(50) NOT NULL DEFAULT '0',
  `r3s1` varchar(50) NOT NULL DEFAULT '0',
  `r3s2` varchar(50) NOT NULL DEFAULT '0',
  `r3s3` varchar(50) NOT NULL DEFAULT '0',
  `r3s4` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table wildcard11.enckey: ~0 rows (approximately)
/*!40000 ALTER TABLE `enckey` DISABLE KEYS */;
/*!40000 ALTER TABLE `enckey` ENABLE KEYS */;


-- Dumping structure for table wildcard11.enckey1
CREATE TABLE IF NOT EXISTS `enckey1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` varchar(50) DEFAULT '0',
  `wildcard1` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2434 DEFAULT CHARSET=latin1;

-- Dumping data for table wildcard11.enckey1: ~381 rows (approximately)
/*!40000 ALTER TABLE `enckey1` DISABLE KEYS */;
INSERT INTO `enckey1` (`id`, `fileid`, `wildcard1`) VALUES
	(2286, '51', 'yybLWh079FdMaGWMYvsFL+d6Qp9jbDUv5IXl8+gVm0o='),
	(2287, '51', 'vxBAyiuAc3jy7B5v0rMuOPQQahDjz7Z29h5AKV6ZS2Y='),
	(2288, '51', 'y7yJdN12K56xSKoB95foYPWPGyckOvJj9R3QvKBodN4='),
	(2289, '51', 'gIiieyR83YZ05B+DO3wDKk1ytvAl9hPhMQl3PvaFSCU='),
	(2290, '51', 'hzhzTqhpyJRVRjB/0SREYZoI2hbO8hUsqpxLiZcNt4c='),
	(2291, '51', 'Qo1wssBee2kwFTMWcjVJwvRf5R7KmYZsHzEwPakMpUo='),
	(2292, '51', 'zTjpKJ4VwuGCAptNT6B+kqKxc3OyXdzDr+qrH0yu0bU='),
	(2293, '51', '/TS4oR9MtwUb4vk9YKrHjFpGiSd3QU+F+Ak2H3XMXhc='),
	(2294, '51', 'BmeDqxMISwgK/NxAnsWQE7r+lMt14gBhKr0Yx8S0fqw='),
	(2295, '51', 'zRgKSVcLWvaHjt9LB+xtPeLbHZ5BRti/F9gDftLDYjQ='),
	(2296, '51', 'shkKtxkVOoq7xKmZquxy0SJJEkFt68X04G5R73vP1nQ='),
	(2297, '51', 'ILMN7mxPXeXIlYEEXFiSs7kbTGweqjjhyjXVJ2xjXFU='),
	(2298, '51', 'cQVY4qZuReiNyURJWzhxV4/d4r5clt/6/L4v3MIJKXY='),
	(2299, '51', '/53Mfh2xAQcpuHfmfkPWL1Tq4VoLiqvCivTvZMXV44w='),
	(2300, '51', 'FX5bznmOI3tgIpFqis7j/pjNTthzB+tu9GXFJG5XjqQ='),
	(2301, '51', 'iu44cPPQvxM7NNho2FALDR9wmNmoNP0R0RnfFiOY0rE='),
	(2302, '51', 'hzhzTqhpyJRVRjB/0SREYZoI2hbO8hUsqpxLiZcNt4c='),
	(2303, '51', 'E/j0yBhlkV7XlJXQPR6SnpzZsH4B77d0JQrukXTSpWo='),
	(2304, '51', '2ENPCsQDr0eGEneOFVbpnL7P/dsWFNRcIwQmU2x4Ht0='),
	(2305, '51', 'dlMKWb8/SUFW28fko2UFNQyy9jYicyJ8AcYireD8wm4='),
	(2306, '51', 'XcWvQ57FOpwNle9BmL5yBw1HPfV+tr23f2SoCR3i7/8='),
	(2307, '51', 'DJqD0p7KNPdE9mh+r5kpGnECYpda/Ie4z02WBXcNvNk='),
	(2308, '51', 'n4ctmJ3/4lpAy64g9A95L4Q2uGIvem28VUXIbStKq6A='),
	(2309, '51', 'I2tQga/1xFiHyjfo5XcOLDWGXPkjUT06MPgwMZlligo='),
	(2310, '51', 'jG2TFH1vBZAacBWeBtyPH9wet87CPDnN5MB5T0OtOn8='),
	(2311, '51', 'qwPVKt66fD8Cc1AQVybQOtlojPfjWXfwSoOA0tohzFM='),
	(2312, '51', '794XbkWA+NgdfxPjKC6vnuibCmt15akLjrwfOo2xAVE='),
	(2313, '51', 'VMWXOnqlm0mAjozyAWFH+Ws2QwoFeAhliYCyGSvCsmM='),
	(2314, '51', '/53Mfh2xAQcpuHfmfkPWL1Tq4VoLiqvCivTvZMXV44w='),
	(2315, '51', 'pHW6Q2VjdZ3DFG8+aHDw/Z+Qj2Lvol/Kq/EWQUX9KJM='),
	(2316, '51', 'NS49CWIoiJXvJTNvb7GN2IMcjFRJVaMhx57Lr9wcsfU='),
	(2317, '51', '5Wzk0pRa6KOrHCfNLm2TW33g8Szj4ea8vU9l9bWVXD4='),
	(2318, '51', 'n4ctmJ3/4lpAy64g9A95L4Q2uGIvem28VUXIbStKq6A='),
	(2319, '51', 'RMkSbm49fPIAq5WaBffN16OvDv5O3pqB9cI8pxAYvIs='),
	(2320, '51', 'mRMipyp6fv5EjMSShjQ7vgR74Ssct1T33VHBix0uUjY='),
	(2321, '51', '4bua16aUYEp4qv8aqAlsMXLAWenDSNNBTzuJPzp4npk='),
	(2322, '51', 'oxxodeBQqyj+o4D9K1qqR0wbLwXmZoOfUd8qVS8nUm4='),
	(2323, '51', 'PnMKJgkXkawaq91S3gPAXz0Tx2JYClODIeeSq3Z1ojY='),
	(2324, '51', 'J32GrjJd8O/yP7wbot1lw95qg5UBSQJqb6bx/dneusM='),
	(2325, '51', '83yWjdJeJhe47qOZ09ayHbpG5EL9XcMBP0XfFjHCzVg='),
	(2326, '51', 'OF7e3M9HowkHS1vgIKY0ziSyWFWbkynqSFm60cJc3JU='),
	(2327, '51', 'Bobp6sGvrNPDWFCacO3kiCmhJhG4qCxoUMzAYxycmBo='),
	(2328, '51', '5uVzQuD8O1zmMNdGkVjDt4QpbAS5MHVZQ3otulFaPhk='),
	(2329, '51', '794XbkWA+NgdfxPjKC6vnuibCmt15akLjrwfOo2xAVE='),
	(2330, '51', 'LDFok0a3TaZOhY9hqe245k2F1JuLLjXyvpytzWFWugY='),
	(2331, '51', '42AzgDLsmzgL5yAXzs8F+XkKLpwdvxQt9hiK1EbB5Uo='),
	(2332, '51', 'RV7h5iA9Uc020N1BL0nrcOcgXDSbudtBdrkmcze/COc='),
	(2333, '51', 'maIpwFcCbBKYXAHqUiXHzYxC2jdazlBRoUz5xWjbA48='),
	(2334, '51', '5Wzk0pRa6KOrHCfNLm2TW33g8Szj4ea8vU9l9bWVXD4='),
	(2335, '51', 'n4ctmJ3/4lpAy64g9A95L4Q2uGIvem28VUXIbStKq6A='),
	(2336, '51', 'CVOSQxv9D8oGKnujOY+Faqr4ahkqZLrk6V27n0nYJvc='),
	(2337, '51', '794XbkWA+NgdfxPjKC6vnuibCmt15akLjrwfOo2xAVE='),
	(2338, '51', '1D9AaaAn/Hfjh/HlCR7kMmsqyo7qRW0XeU3GhVosDIg='),
	(2339, '51', 'pHW6Q2VjdZ3DFG8+aHDw/Z+Qj2Lvol/Kq/EWQUX9KJM='),
	(2340, '51', 'LDFok0a3TaZOhY9hqe245k2F1JuLLjXyvpytzWFWugY='),
	(2341, '51', 'JSKNpSrnaOG2cChDa4NqQp4HEbOFw+8YktX+w8G+2jE='),
	(2342, '51', 'sHMBkY3/QRTobS2SMc0ZbNEyuNw0FbKL/b815eE/Su8='),
	(2343, '51', '/TS4oR9MtwUb4vk9YKrHjFpGiSd3QU+F+Ak2H3XMXhc='),
	(2344, '51', '+laYmuRXuj9zjxEep0mxMYFezlFPXmzdVYHK/57+xiw='),
	(2345, '51', 'PlpwaiP4VlJxr+G97x+517lMwfhGwlHNj7ntPrrBOKE='),
	(2346, '51', '95fdcz2mHCMdxMAElRWBE6M/NSX4SdYq9ThdsGlnd5s='),
	(2347, '51', 'Qo1wssBee2kwFTMWcjVJwvRf5R7KmYZsHzEwPakMpUo='),
	(2348, '51', 'HQnQDj/Ox+3xfmfOCItRfpxolCJF6a8bBHMr4VcrplQ='),
	(2349, '51', 'R7w5rg4L8qGP7OQFdla4twh0KIh3OOJWFoBRpnU0aGc='),
	(2350, '51', 'y7yJdN12K56xSKoB95foYPWPGyckOvJj9R3QvKBodN4='),
	(2351, '51', 'Spiq/Gi+t1eJ4yTGZyJq+EKaOar/2Y6MGAkxQQggJ6I='),
	(2352, '51', 'hzhzTqhpyJRVRjB/0SREYZoI2hbO8hUsqpxLiZcNt4c='),
	(2353, '51', 'BgkZe7zW0EKMoIUcwdczOfNKAlUElXZlMy5TLZupnMA='),
	(2354, '51', 'rS3EUJQ/UtGafmdej28wxuUIvop00b90aYWA500km0s='),
	(2355, '51', 'yxS6zThQzqQ53SRpVkXkacz6B2Lk5mZVzpuigGXmG2A='),
	(2356, '51', 'vW86C44nfZD/wtbCcz8r8ySLEVNtxc0YylkbRPoHxWo='),
	(2357, '51', 'wXS6oJkhygutJ/FNRHkTUvdiYe6E+8v7Dhei+klpX10='),
	(2358, '51', 'gWgP3tzoum/vxVso1X9cjL5yLf8mjaL5eIMYbNCd3BQ='),
	(2359, '51', 'GpiWAn9/SG1rWivTWtmB3Od4NJnRn+dryub67zM2/TUFIlotfIC6uQKwVXO1ZDRA'),
	(2360, '51', 'W6lM8uX3j1dlgoLE3l6J/v57Lv2tE+9t8ZynN4va97c='),
	(2361, '51', 'khrufBwOPBTALkR3wBuuWyEIChSVqme1EYr7JSByOSg='),
	(2362, '51', 'hzhzTqhpyJRVRjB/0SREYZoI2hbO8hUsqpxLiZcNt4c='),
	(2363, '51', 'xJe/JtFfria+54dpAbFH84qExIFcpZugG3Pqeosu96c='),
	(2364, '51', 'l+LBA28Ao+l2YMWfk/fWgzDwrAL1Tqt4cuHii5oW2B0='),
	(2365, '51', 'Y2icFU3fyt8b1pY23XPJLwGrqBRNh4ZgFs/UB8PPzIU='),
	(2366, '51', 'oR28wloIWU5S+IBzIrlr/m4Wjuzt0zst2ycxRo+vmJM='),
	(2367, '51', 'oibtnqzghWIz+XuWDOM5BFKJ53Nc3+4meHHBZCZO1a8='),
	(2368, '51', 'V1Cm03B0kfIudkQ03Gt6MubfFTFiI0mIFqOt/gtjfuM='),
	(2369, '51', 'DmegmAC2ks1Fj4oYrM1gfGDKKfHlHatg4O7c48SGI1s='),
	(2370, '51', '0+M3XUEapI7GBLYS/tDOJhPYYx24yLMbyYwVLjrje1E='),
	(2371, '51', '4yPcf3lbKCKasT8n2J5eV3Iak1hSPhbW2YXOx1mWFec='),
	(2372, '51', 'Rwrv9oBZHIaH0qovap+0Mqid2zGP0qRnqGVSbQFvNfo='),
	(2373, '51', 'gIiieyR83YZ05B+DO3wDKk1ytvAl9hPhMQl3PvaFSCU='),
	(2374, '51', '1Q3IHgaUfv4m+W8p1NVtod4CQxH/5CY2m4uWfX+4xCQ='),
	(2375, '51', '48L2PA8zVrXGjFb3fENtwPYa33CiWX3TppM/vnYCm2w='),
	(2376, '51', 'DJqD0p7KNPdE9mh+r5kpGnECYpda/Ie4z02WBXcNvNk='),
	(2377, '51', 'e2af0Uc6Tu+/IEc5co8xVVduUJSEFPJyTlN94ebBJ/o='),
	(2378, '51', 'PlpwaiP4VlJxr+G97x+517lMwfhGwlHNj7ntPrrBOKE='),
	(2379, '51', 'rB8TfihLHZRRI40n/dR/g09CSH2LkrsqcMKvC2RkRxw='),
	(2380, '51', 'N/agqN+qeE9kVqRsMOus4PWEv+wVoHQcKQJo3Ie28ZA='),
	(2381, '51', 'IKuugVGHJYvpOChDbaXm7gt9h6GaGK8jKryzuOjZJUA='),
	(2382, '51', 'GzcaFMV6Tp8gsF5NjOFGTOTCdYiG29osmdy2Uncab8g='),
	(2383, '51', 'gIiieyR83YZ05B+DO3wDKk1ytvAl9hPhMQl3PvaFSCU='),
	(2384, '51', 'c5BCPNH+YIa1kdlV3djLCamQ51ED2N9EyEU7XdWzshU='),
	(2385, '51', 'G1YBKcf+7tDcQK099FBMgGoz/myn3nI4PQFlmW/JxvY='),
	(2386, '51', 'JVPldYcUu03RctdNvBLSeYQ1TqmebL+hPGA6yKJSV04='),
	(2387, '51', 'AzorcLmDhG9FS7L+7oDE4oDguNZa1e01GTlns+qei0Q='),
	(2388, '51', 'Qo1wssBee2kwFTMWcjVJwvRf5R7KmYZsHzEwPakMpUo='),
	(2389, '51', 'DJqD0p7KNPdE9mh+r5kpGnECYpda/Ie4z02WBXcNvNk='),
	(2390, '51', 'hzhzTqhpyJRVRjB/0SREYZoI2hbO8hUsqpxLiZcNt4c='),
	(2391, '51', 'PlpwaiP4VlJxr+G97x+517lMwfhGwlHNj7ntPrrBOKE='),
	(2392, '51', 'JVPldYcUu03RctdNvBLSeYQ1TqmebL+hPGA6yKJSV04='),
	(2393, '51', 'ghhv6h2WUHx7m120R4ln+Zg5x1qUK3Q9X8ipwVsBzLU='),
	(2394, '51', '/lXaz8ChOfmz9qW5+E6c5CisnujR7qCeMzwScrX3Wl0FIlotfIC6uQKwVXO1ZDRA'),
	(2395, '51', 'iLl0H+XSPAw3HWWGmT0iMlVnSwwZswWqbu4xGkqTTPI='),
	(2396, '51', 'mH0elnIJHLVq4Ghlz3irw1YpMESXWIDIXkC0gxdYsCk='),
	(2397, '51', 'fobdXWRZXX/Nm6D3TJw6S9xnLkJrOoXKk8STIcbiiKs='),
	(2398, '51', 'ALaxkOJLzsqyL7y7Jv/gg/Xe8mjATf1YL3q8t6xUdic='),
	(2399, '51', 'nOC+phdVEIB/jvJtKA3FKrfyl2nYjUR8AQXpKaBLL+k='),
	(2400, '51', 'AzorcLmDhG9FS7L+7oDE4oDguNZa1e01GTlns+qei0Q='),
	(2401, '51', 'yybLWh079FdMaGWMYvsFL+d6Qp9jbDUv5IXl8+gVm0o='),
	(2402, '51', '6QFnP4CE0jh2M6dKrAlyMdzLL0WayzDzVFHxn/bz8ec='),
	(2403, '51', 'CLwAKBTMpUheEhJ1ygMephNfefvODLTLX/bo8ijkYOA='),
	(2404, '51', '48L2PA8zVrXGjFb3fENtwPYa33CiWX3TppM/vnYCm2w='),
	(2405, '51', 'XzBktqEOW8z1h6PzOiwPQyyufXSCWxeaAOawHlwmWVM='),
	(2406, '51', 'Pb2WHQAXILkkPxcLo3zgFZWkxTktDHjnOpxWRBE6/N4='),
	(2407, '51', 'xNpAFcRCiecU/ws3qsmYBk7qwcCGzgs69Gai7Nu1jD8='),
	(2408, '51', 'ALaxkOJLzsqyL7y7Jv/gg/Xe8mjATf1YL3q8t6xUdic='),
	(2409, '51', '/TS4oR9MtwUb4vk9YKrHjFpGiSd3QU+F+Ak2H3XMXhc='),
	(2410, '51', '6QFnP4CE0jh2M6dKrAlyMdzLL0WayzDzVFHxn/bz8ec='),
	(2411, '51', 'xqa428TSOnTbJSGIb8KErDz+o2OjuoKNMF2BYX9rz2Y='),
	(2412, '51', 'gmYB7osQy93f51T6p0CJQQVjsBnJuR2W0NqYcwZUjRk='),
	(2413, '51', 'mRMipyp6fv5EjMSShjQ7vgR74Ssct1T33VHBix0uUjY='),
	(2414, '51', 'jdOfEApnAegFOhsRHYSAL3wyQrxP1EfYl7uEkJh090I='),
	(2415, '51', 'gNqwSqFBSbzqGFB5f9u3Zmgjg2cEX0K6hESEHSOGPGs='),
	(2416, '51', 'LyCcP5gVr8GEex7B79Fl8dPFe/Zj3yg43hvIRQWCatY='),
	(2417, '51', 'lzTURUtN4QIA6zix8IC6dsnBWOTTOwjO7bIRAvnONCs='),
	(2418, '51', 'goKKa4qSxk7QRhfDiqT5MmX4iaMLDlm3AfyYtTIWZ0Q='),
	(2419, '51', 'pWF8tH2wQ5B9JtSJFc54u2/Jk6VckmKYEF6uWCxGHxA='),
	(2420, '51', 'B0yMCBf1nLi6uCh2r1hY/ZH+SKPNJhMVx35ZazefsFQ='),
	(2421, '51', 'qRem7geSloeLGDknCvmY412HDyjpCzQYCCV2e5wjFXg='),
	(2422, '51', 'WxD6jD0qBVK9rSfi4WS/giV1HfGenzLn2dDCC8IyVOc='),
	(2423, '51', 'dr1Qet7+362059C8H2i8o3ZT2VCJdHPjJhyK9Ki9yxQ='),
	(2424, '51', 'OYrUzrvZWHhPuyQBIjvM3vrBIcH0HXuMM2zWhzdRJRA='),
	(2425, '51', '4Ll0yT2UjCw7oKXxE7Vik6ajLg3ht5ypMA3awXuyB9M='),
	(2426, '51', 'LkPXG//K7FSiZpe4p2q9IJfCQCfkYcoOpf6rFMJmPQ0='),
	(2427, '51', 'AURW99IjMxuPNtQtLDHAoTtbPUOewi+xYQ2IlzVWlmE='),
	(2428, '51', 'UvuGJ+raUlhtU4iWIV2Wv+QqbzpOqqCtW58YWKouY9M='),
	(2429, '51', '8FqF0gWR9pSYkqIol3MgNvJoFjrKZZOMbI+vRMeqIW0='),
	(2430, '51', 'NdNLm7lYrezJAgcDcwAUidLTZ1LbsJLKKONl0ovR8Co='),
	(2431, '51', '2L47w9Jc1GwxWQ6Ptw4UQipEKfsGMpmULvystXkFdYU='),
	(2432, '51', 'SeMNosoUvjr18LkM20vUXU5PjRD8KrlB8zDj3H5LDZo='),
	(2433, '51', 'EHuVzrGiu7j0fsr6oeJc4LXA6yo1EfbwtqIDPW0Cigk=');
/*!40000 ALTER TABLE `enckey1` ENABLE KEYS */;


-- Dumping structure for table wildcard11.graphtbl
CREATE TABLE IF NOT EXISTS `graphtbl` (
  `fileid` int(200) DEFAULT NULL,
  `uploadTime` varchar(200) DEFAULT NULL,
  `EncryptTime` varchar(200) DEFAULT NULL,
  `user_id` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table wildcard11.graphtbl: ~2 rows (approximately)
/*!40000 ALTER TABLE `graphtbl` DISABLE KEYS */;
INSERT INTO `graphtbl` (`fileid`, `uploadTime`, `EncryptTime`, `user_id`) VALUES
	(49, '0.02515', '0.002', 54),
	(50, '0.02515', '0.44', 54),
	(51, '0.02515', '0.002', 54);
/*!40000 ALTER TABLE `graphtbl` ENABLE KEYS */;


-- Dumping structure for table wildcard11.graphtbl2
CREATE TABLE IF NOT EXISTS `graphtbl2` (
  `fileid` int(200) DEFAULT NULL,
  `downloadTime` varchar(200) DEFAULT NULL,
  `DecryptTime` varchar(200) DEFAULT NULL,
  `user_id` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table wildcard11.graphtbl2: ~1 rows (approximately)
/*!40000 ALTER TABLE `graphtbl2` DISABLE KEYS */;
INSERT INTO `graphtbl2` (`fileid`, `downloadTime`, `DecryptTime`, `user_id`) VALUES
	(49, '0.008', '0.007', 54);
/*!40000 ALTER TABLE `graphtbl2` ENABLE KEYS */;


-- Dumping structure for table wildcard11.groupuser
CREATE TABLE IF NOT EXISTS `groupuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL DEFAULT '0',
  `lastname` varchar(200) NOT NULL DEFAULT '0',
  `groupname` varchar(200) NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '0',
  `password` varchar(200) NOT NULL DEFAULT '0',
  `Usertype` varchar(200) NOT NULL DEFAULT '0',
  `regdate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table wildcard11.groupuser: ~5 rows (approximately)
/*!40000 ALTER TABLE `groupuser` DISABLE KEYS */;
INSERT INTO `groupuser` (`id`, `firstname`, `lastname`, `groupname`, `email`, `password`, `Usertype`, `regdate`) VALUES
	(2, 'mahesh', 'shukla', 'Friends', 'mahesh@yahoo.com', '123', 'GroupOwner', '2016-03-19'),
	(3, 'swapnil', 'kumawat', 'Family', 'kumawat.swapnil@gmail.com', '123', 'GroupOwner', '2016-03-07'),
	(4, 'Ashish', 'ash', 'ABC', 'abc@yahoo.com', '123', 'GroupOwner', '2016-03-19'),
	(5, 'Pallavi', 'MadaM', 'Colllege', 'pallavi@gmail.com', '1234', 'GroupOwner', '2016-03-21'),
	(6, 'rahul', 'patil', 'rahul', 'rahul@gmail.com', '123', 'GroupOwner', '2017-11-17');
/*!40000 ALTER TABLE `groupuser` ENABLE KEYS */;


-- Dumping structure for table wildcard11.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `contactNo` varchar(200) DEFAULT NULL,
  `Usertype` varchar(200) DEFAULT NULL,
  `GroupID` varchar(200) DEFAULT '1',
  `userduration` int(11) DEFAULT '0',
  `AuthorisedGroup` varchar(200) DEFAULT '0',
  `Status` varchar(200) DEFAULT '0',
  `expire_date` varchar(50) DEFAULT '0000-00-00',
  `regDate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- Dumping data for table wildcard11.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `fname`, `lname`, `email`, `gender`, `password`, `contactNo`, `Usertype`, `GroupID`, `userduration`, `AuthorisedGroup`, `Status`, `expire_date`, `regDate`) VALUES
	(54, 'jaydeep', 'salokhe', 'jaydeep@gmail.com', 'Male', '123456', '9898989898', 'User', '6', 15, '0', '1', '06/04/2019', '22/03/2019'),
	(55, 'tejas', 'patil', 'tejas@gmail.com', 'Male', '123456', '9898989898', 'User', '6', 15, '0', '1', '06/04/2019', '22/03/2019'),
	(56, 'ganesh', 'patil', 'ganesh@gmail.com', 'Male', '123456', '9898989898', 'User', '5', 15, '0', '1', '06/04/2019', '22/03/2019');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table wildcard11.userfile
CREATE TABLE IF NOT EXISTS `userfile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(200) DEFAULT NULL,
  `uploadedBy` varchar(200) DEFAULT NULL,
  `uploadDate` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `FileSize` varchar(50) DEFAULT NULL,
  `FileData` longtext,
  `secKey` varchar(100) DEFAULT NULL,
  `UserSecretKey` varchar(100) DEFAULT '0',
  `CloudSecretKey` varchar(100) DEFAULT '0',
  `AuthorisedGroup` varchar(100) DEFAULT NULL,
  `AccessLevel` varchar(100) DEFAULT NULL,
  `tpaverification` varchar(100) DEFAULT '0',
  `Status` varchar(100) DEFAULT 'No',
  `VerificationStatus` varchar(100) DEFAULT 'No',
  `digestKey` text,
  `serverDigestKey` text,
  `identity` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- Dumping data for table wildcard11.userfile: ~2 rows (approximately)
/*!40000 ALTER TABLE `userfile` DISABLE KEYS */;
INSERT INTO `userfile` (`id`, `fileName`, `uploadedBy`, `uploadDate`, `type`, `FileSize`, `FileData`, `secKey`, `UserSecretKey`, `CloudSecretKey`, `AuthorisedGroup`, `AccessLevel`, `tpaverification`, `Status`, `VerificationStatus`, `digestKey`, `serverDigestKey`, `identity`) VALUES
	(51, 'jd.txt', '54', '2019/03/22 19:32:13', 'text/plain', '1509', NULL, 'KygQRFgajS', '0', '0', NULL, NULL, 'Verified', 'No', 'Recovered', '3c722977f4e4d45832936249a992a67e', 'e225439f25bdde18933b49d8c16e6f9e', '56');
/*!40000 ALTER TABLE `userfile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
