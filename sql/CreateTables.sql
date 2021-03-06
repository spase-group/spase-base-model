
CREATE TABLE `action` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Submitter` varchar(40) NOT NULL,
  `SubmitDate` date NOT NULL,
  `Title` varchar(80) NOT NULL,
  `Description` text NOT NULL,
  `Discussion` text NOT NULL,
  `Resolution` text NOT NULL,
  `Status` enum('topic','draft','review','vote','rejected','approved','resolved') default 'topic',
  `ModifyDate` date NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `dictionary` (
  `Version` varchar(40) NOT NULL,
  `Since` varchar(40) NOT NULL,
  `Term` varchar(40) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `List` varchar(40) NOT NULL,
  `Elements` text NOT NULL,
  `Attributes` varchar(255) NOT NULL,
  `Definition` text NOT NULL,
  UNIQUE KEY `Version` (`Version`,`Term`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `list` (
  `Version` varchar(40) NOT NULL,
  `Since` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Type` varchar(10) default NULL,
  `Reference` varchar(255) default NULL,
  `Description` text NOT NULL,
  UNIQUE KEY `Version` (`Version`,`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `member` (
  `Version` varchar(40) NOT NULL,
  `Since` varchar(40) NOT NULL,
  `List` varchar(40) NOT NULL,
  `Term` varchar(30) NOT NULL,
  UNIQUE KEY `Version` (`Version`,`List`,`Term`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `ontology` (
  `Version` varchar(40) NOT NULL,
  `Since` varchar(40) NOT NULL,
  `Object` varchar(40) NOT NULL,
  `Element` varchar(40) NOT NULL,
  `Pointer` varchar(4) NOT NULL,
  `Occurence` varchar(4) NOT NULL,
  `Group` varchar(40) NOT NULL,
  UNIQUE KEY `Version` (`Version`,`Object`,`Element`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `type` (
  `Version` varchar(40) NOT NULL,
  `Since` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Description` text NOT NULL,
  UNIQUE KEY `Version` (`Version`,`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `history` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Version` varchar(40) NOT NULL,
  `Updated` varchar(40) NOT NULL,
  `ChangedBy` varchar(40) NOT NULL,
  `Description` text NOT NULL,
  `Note` text NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

