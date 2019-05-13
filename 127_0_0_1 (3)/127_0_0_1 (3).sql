-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2019 at 10:54 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `18_waqqas_pessdb`
--
CREATE DATABASE IF NOT EXISTS `18_waqqas_pessdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `18_waqqas_pessdb`;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incidentid` int(11) NOT NULL,
  `patrolcarid` varchar(10) NOT NULL,
  `timeDispatched` datetime NOT NULL,
  `timeArrived` datetime DEFAULT NULL,
  `timeCompleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incidentid`, `patrolcarid`, `timeDispatched`, `timeArrived`, `timeCompleted`) VALUES
(12, 'QX2222G', '2014-05-29 10:51:15', '0000-00-00 00:00:00', '2014-05-29 10:53:43'),
(13, 'QX2222G', '2014-05-29 10:59:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'QX4444P', '2014-05-29 11:10:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incidentid` int(11) NOT NULL,
  `callerName` varchar(30) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `incidentTypeld` varchar(3) NOT NULL,
  `incidentLocation` varchar(50) NOT NULL,
  `incidentDesc` varchar(100) NOT NULL,
  `incidentStatusld` varchar(1) NOT NULL,
  `timeCalled` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incidentid`, `callerName`, `phoneNumber`, `incidentTypeld`, `incidentLocation`, `incidentDesc`, `incidentStatusld`, `timeCalled`) VALUES
(6, 'PETER LEOW', '81234567', '010', 'Juction of North Bridge Rd and Middle Road', 'A bus collided with a  taxi 2 injuries', '1', '2019-02-25 03:49:59'),
(8, ' qwerty', '12345678', '030', 'cck', 'qwerty', '3', '2019-02-25 03:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `incidentstatus`
--

CREATE TABLE `incidentstatus` (
  `statusid` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incidentstatus`
--

INSERT INTO `incidentstatus` (`statusid`, `statusDesc`) VALUES
('3', 'Completed'),
('2', 'Dispatched'),
('4', 'Duplictaed'),
('1', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `incidenttype`
--

CREATE TABLE `incidenttype` (
  `incidentTypeid` varchar(3) NOT NULL,
  `incidentTypeDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incidenttype`
--

INSERT INTO `incidenttype` (`incidentTypeid`, `incidentTypeDesc`) VALUES
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('010', 'Fire'),
('070', 'Loan Shark'),
('999', 'Others'),
('020', 'Riot'),
('060', 'Traffic Accident');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcarid` varchar(10) NOT NULL,
  `patrolcarStatusid` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcarid`, `patrolcarStatusid`) VALUES
('QX1234', '3'),
('QX4321R', '3'),
('QX4444P', '1'),
('QX45545', '1'),
('QX9999H', '1');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcarstatus`
--

CREATE TABLE `patrolcarstatus` (
  `statusid` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcarstatus`
--

INSERT INTO `patrolcarstatus` (`statusid`, `statusDesc`) VALUES
('1', 'Dispatched'),
('3', 'Free'),
('5', 'NA'),
('4', 'On-site'),
('2', 'Patrol');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incidentid`,`patrolcarid`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incidentid`);

--
-- Indexes for table `incidentstatus`
--
ALTER TABLE `incidentstatus`
  ADD PRIMARY KEY (`statusDesc`);

--
-- Indexes for table `incidenttype`
--
ALTER TABLE `incidenttype`
  ADD PRIMARY KEY (`incidentTypeDesc`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcarid`);

--
-- Indexes for table `patrolcarstatus`
--
ALTER TABLE `patrolcarstatus`
  ADD PRIMARY KEY (`statusDesc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incidentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
