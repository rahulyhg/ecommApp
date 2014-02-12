-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 12, 2014 at 10:52 AM
-- Server version: 5.1.61
-- PHP Version: 5.3.6-13ubuntu3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecommapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE IF NOT EXISTS `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sender_signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `points` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `address` text,
  `created_at` date DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `points`, `owner_name`, `mobile_number`, `address`, `created_at`, `email_id`) VALUES
(1, 'Default', '500000', 'Xavoc Technocrats', '+91 8875191258', '18/436 Gayatri Marg, Kanji Ka Hata, Dhabai Ji Ka Wada, udaipur', '2011-12-12', 'info@xavoc.com');

-- --------------------------------------------------------

--
-- Table structure for table `ecommApp_shop`
--

CREATE TABLE IF NOT EXISTS `ecommApp_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ecommApp_shop`
--

INSERT INTO `ecommApp_shop` (`id`, `epan_id`, `name`, `address`) VALUES
(1, 1, 'Ramlal and Sons', 'Udaipur');

-- --------------------------------------------------------

--
-- Table structure for table `epan`
--

CREATE TABLE IF NOT EXISTS `epan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fund_alloted` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `website` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `last_email_sent` datetime DEFAULT NULL,
  `allowed_aliases` int(11) DEFAULT NULL,
  `parked_domain` varchar(255) DEFAULT NULL,
  `email_host` varchar(255) DEFAULT NULL,
  `email_port` varchar(255) DEFAULT NULL,
  `email_username` varchar(255) DEFAULT NULL,
  `email_password` varchar(255) DEFAULT NULL,
  `email_reply_to` varchar(255) DEFAULT NULL,
  `email_reply_to_name` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_from_name` varchar(255) DEFAULT NULL,
  `is_frontent_regiatrstion_allowed` tinyint(1) DEFAULT NULL,
  `user_activation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_staff1` (`staff_id`),
  KEY `fk_epan_epan_categories1` (`category_id`),
  FULLTEXT KEY `tags_description_full_text` (`keywords`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `epan`
--

INSERT INTO `epan` (`id`, `name`, `staff_id`, `branch_id`, `password`, `fund_alloted`, `created_at`, `category_id`, `company_name`, `contact_person_name`, `mobile_no`, `address`, `city`, `state`, `country`, `email_id`, `keywords`, `description`, `website`, `is_active`, `is_approved`, `last_email_sent`, `allowed_aliases`, `parked_domain`, `email_host`, `email_port`, `email_username`, `email_password`, `email_reply_to`, `email_reply_to_name`, `email_from`, `email_from_name`, `is_frontent_regiatrstion_allowed`, `user_activation`) VALUES
(1, 'web', 1, 1, 'admin', '5000000', '2014-01-26', 1, 'Xavoc Technocrats Pvt. Ltd.', 'Xavoc Admin', '+91 8875191258', '18/436, Gayatri marg, Kanji Ka hata, Udaipur, Rajasthan , India', 'Udaipur', 'Rajasthan', 'India', 'info@xavoc.com', 'xEpan CMS, an innovative approach towards Drag And Drop CMS.', 'World''s best and easiest cms :)', 'http://www.xavoc.com', 1, 1, NULL, 1, NULL, '', '', '', '', '', '', '', '', 1, 'self_activated');

-- --------------------------------------------------------

--
-- Table structure for table `epan_aliases`
--

CREATE TABLE IF NOT EXISTS `epan_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `epan_categories`
--

CREATE TABLE IF NOT EXISTS `epan_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent_category_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`id`),
  KEY `cat_parent` (`parent_category_id`),
  KEY `func_getPathWay` (`id`,`parent_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `epan_categories`
--

INSERT INTO `epan_categories` (`id`, `name`, `description`, `parent_category_id`, `ordering`) VALUES
(1, 'Default', 'Default', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `epan_components_marketplace`
--

CREATE TABLE IF NOT EXISTS `epan_components_marketplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_final` tinyint(1) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `allowed_children` varchar(255) DEFAULT NULL,
  `specific_to` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT NULL,
  `plugin_hooked` text,
  `description` text,
  `default_enabled` tinyint(1) DEFAULT NULL,
  `has_toolbar_tools` tinyint(1) DEFAULT NULL,
  `has_owner_modules` tinyint(1) DEFAULT NULL,
  `has_plugins` tinyint(1) DEFAULT NULL,
  `has_live_edit_app_page` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `epan_components_marketplace`
--

INSERT INTO `epan_components_marketplace` (`id`, `name`, `is_final`, `rate`, `allowed_children`, `specific_to`, `namespace`, `type`, `is_system`, `plugin_hooked`, `description`, `default_enabled`, `has_toolbar_tools`, `has_owner_modules`, `has_plugins`, `has_live_edit_app_page`) VALUES
(1, 'Image', 1, '50', NULL, NULL, 'imageElement', 'element', 1, NULL, NULL, NULL, 1, NULL, 0, NULL),
(2, 'RowColumn', 0, '0', '3', '', 'rowColumnElement', 'element', 1, NULL, NULL, NULL, 1, NULL, 0, NULL),
(4, 'SlideShow', 0, '0', '5', '', 'slideshowModule', 'module', 0, NULL, NULL, NULL, 1, NULL, 0, NULL),
(6, 'Text', 0, '0', NULL, NULL, 'textElement', 'element', 1, NULL, NULL, NULL, 1, NULL, 0, NULL),
(7, 'Title', 1, '0', NULL, NULL, 'titleElement', 'element', 1, NULL, NULL, NULL, 1, NULL, 0, NULL),
(8, 'EnquiryForm', 1, '0', '', NULL, 'enquiryformModule', 'module', 0, NULL, NULL, NULL, 1, NULL, 0, NULL),
(10, 'MenuBar', 0, '0', '11', '', 'menubarModule', 'module', 0, NULL, NULL, NULL, 1, NULL, 0, NULL),
(13, 'SystemContentManipulations', 1, '0', NULL, NULL, 'systemcontentmanipulationPlugins', 'plugins', 1, 'output-fetched', NULL, 1, NULL, NULL, 1, NULL),
(12, 'Container', 0, '0', '', '', 'containerElement', 'element', 1, NULL, NULL, NULL, 1, NULL, 0, NULL),
(16, 'SocialShare', NULL, NULL, NULL, NULL, 'socialshareModule', 'module', 0, NULL, NULL, NULL, 1, NULL, 0, NULL),
(20, 'Backup And Restore App', NULL, NULL, NULL, NULL, 'backupandrestoreApp', 'application', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Simple Image Gallary App', NULL, NULL, NULL, NULL, 'simpleImageGallaryApp', 'application', 0, NULL, 'bla bla bla', 0, 1, 0, 0, 0),
(22, 'Visitor Counter', NULL, NULL, NULL, NULL, 'visitorCounterApp', 'application', 0, 'epan-hit', 'sdfsd', 0, 1, 0, 0, 0),
(26, 'User Login', NULL, NULL, NULL, NULL, 'userLoginElement', 'element', 1, NULL, NULL, 0, 1, NULL, NULL, NULL),
(27, 'eComm Application', NULL, NULL, NULL, NULL, 'ecommApp', 'application', 0, NULL, 'Online Sales Facility', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `epan_installed_components`
--

CREATE TABLE IF NOT EXISTS `epan_installed_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `installed_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `epan_installed_components`
--

INSERT INTO `epan_installed_components` (`id`, `epan_id`, `component_id`, `enabled`, `params`, `installed_on`) VALUES
(1, 1, 13, 1, NULL, '2014-01-26'),
(2, 1, 8, 1, NULL, '2014-01-27'),
(5, 1, 27, 1, NULL, '2014-02-06'),
(6, 1, 10, 1, NULL, '2014-02-08'),
(7, 1, 22, 1, NULL, '2014-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `epan_page`
--

CREATE TABLE IF NOT EXISTS `epan_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `menu_caption` varchar(255) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT NULL,
  `title` text,
  `description` text,
  `keywords` text,
  `content` text,
  `body_attributes` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `access_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_page_epan1` (`epan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `epan_page`
--

INSERT INTO `epan_page` (`id`, `name`, `menu_caption`, `epan_id`, `is_template`, `title`, `description`, `keywords`, `content`, `body_attributes`, `created_on`, `updated_on`, `access_level`) VALUES
(1, 'home', 'Home', 1, 0, 'xEpan CMS, an innovative approach towards Drag And Drop CMS.', 'World''s best and easiest cms :)', 'xEpan CMS, an innovative approach towards Drag And Drop CMS.', '\n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n\n\n\n\n\n\n\n\n\n<div id="1ddc29d6-a81d-4a48-9d47-5b4e94255a05" component_namespace="titleElement" component_type="Title" class="epan-component component-outline" style="" contenteditable="true">  	<h1>I M Titleg fsdfhvb111sdfdsf<br>\n</h1> </div>\n\n\n\n\n\n\n\n\n\n\n\n\n<div id="6523bbff-44cf-4ed0-a40c-1eb2e92ec290" component_namespace="textElement" component_type="Text" class="editor epan-component " style="" contenteditable="true"><blockquote> 	I M DEFAULT TEXT ...sdaasdas</blockquote></div><div id="42c84a65-394e-4690-c4f2-ced0dd00d5e0" component_namespace="rowColumnElement" component_type="Row" class="epan-component epan-sortable-component  row ui-sortable component-outline epan-sortable-extra-padding" style=""> 	 <div id="831ff767-95b7-486f-8756-48bbb06d3718" component_namespace="rowColumnElement" component_type="Column" class="col-md-4  ui-sortable component-outline" style="" span="4"> 	 <div id="67f31814-bae5-472f-8f7a-4fa2e9b649e8" data-responsible-namespace="userLoginElement" data-responsible-view="View_Server_UserLogin" data-is-serverside-component="true" component_namespace="userLoginElement" component_type="UserLogin" class="component-outline" style=""><div id="f330ef5d__server_userlogin" class="" style="">\n<div id="f330ef5d__server_userlogin_view" class="" style="">Welcome Admin,</div>\n\n<button aria-disabled="false" role="button" id="f330ef5d__server_userlogin_button" style="" type="button" class="ui-state-default ui-corner-all  ui-button ui-widget ui-button-text-only" name="f330ef5d__server_userlogin_button"><span class="ui-button-text">Logout</span></button>\n</div>\n</div>\n</div>\n<div id="7abe04ea-15e6-48c4-e61c-72cfb076a227" component_namespace="rowColumnElement" component_type="Column" class="col-md-4  ui-sortable component-outline" style="" span="4"> 	 </div>\n<div id="51e317d9-c528-4d5f-b7e7-c70b712fee4a" component_namespace="rowColumnElement" component_type="Column" class="col-md-4  ui-sortable component-outline" style="" span="4"> 	 </div>\n</div>\n<div id="6f622628-323b-47e6-b683-1abd05e8369b" component_namespace="titleElement" component_type="Title" class="epan-component component-outline" style="" contenteditable="true">  	<h1>I M Titleh gjhg<br>\n</h1> </div>\n\n<div id="2662edef-8d3e-43bc-f98e-20ce6de42063" data-responsible-namespace="visitorCounterApp" data-responsible-view="View_VisitorCounterMain" data-is-serverside-component="true" component_namespace="visitorCounterApp" component_type="VisitorCounter" class="epan-component  component-outline" style=""><div id="7511a57f___visitorcountermain" style=";font-size:12px ">\n\n<div class="row">\n	<div class="col-md-6">\n		<small>Total Visits</small>\n	</div>\n	<div class="col-md-6 odometer odometer-auto-theme"><div class="odometer-inside"><span class="odometer-digit"><span class="odometer-digit-spacer">8</span><span class="odometer-digit-inner"><span class="odometer-ribbon"><span class="odometer-ribbon-inner"><span class="odometer-value">2</span></span></span></span></span><span class="odometer-formatting-mark">,</span><span class="odometer-digit"><span class="odometer-digit-spacer">8</span><span class="odometer-digit-inner"><span class="odometer-ribbon"><span class="odometer-ribbon-inner"><span class="odometer-value">3</span></span></span></span></span><span class="odometer-digit"><span class="odometer-digit-spacer">8</span><span class="odometer-digit-inner"><span class="odometer-ribbon"><span class="odometer-ribbon-inner"><span class="odometer-value">4</span></span></span></span></span><span class="odometer-digit"><span class="odometer-digit-spacer">8</span><span class="odometer-digit-inner"><span class="odometer-ribbon"><span class="odometer-ribbon-inner"><span class="odometer-value">5</span></span></span></span></span></div></div>\n</div>\n\n\n\n\n\n\n\n\n</div>\n</div>\n\n\n\n\n', 'cursor: move;', NULL, '2014-02-09 12:08:59', NULL),
(2, 'about-us', 'About Us', 1, 0, 'web', 'World''s best and easiest cms :)', 'xEpan CMS, an innovative approach towards Drag And Drop CMS.', '\n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n\n\n\n\n\n\n\n\n\n<div id="1ddc29d6-a81d-4a48-9d47-5b4e94255a05" component_namespace="titleElement" component_type="Title" class=" epan-component " style="" contenteditable="true">  	<h1>I M sdfsdfsdfsdfsdfsdfsdfsdfs gfdf gdfg d</h1><p>I am About Us<br></p> </div>\n\n\n\n\n\n\n\n', 'cursor: auto;', '2014-02-08 13:07:53', '2014-02-08 18:35:40', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `epan_page_snapshots`
--

CREATE TABLE IF NOT EXISTS `epan_page_snapshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_page_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `body_attributes` text,
  `content` text,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `epan_templates`
--

CREATE TABLE IF NOT EXISTS `epan_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `is_current` tinyint(1) DEFAULT NULL,
  `css` text,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `epan_templates`
--

INSERT INTO `epan_templates` (`id`, `epan_id`, `name`, `content`, `is_current`, `css`) VALUES
(1, 1, 'default', '\n			\n			\n			\n			\n			\n			\n			\n			<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<nav data-extra-classes="navbar-inverse" id="8fb0ca2a-d3d8-475c-81ac-78d8e388a17c" component_namespace="menubarModule" component_type="MenuBar" style="" class="navbar navbar-default epan-component navbar-inverse" role="navigation"> 	<!-- Brand and toggle get grouped for better mobile display --> 	<div class="navbar-header"> 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> 			<span class="sr-only">Toggle navigation</span> 			<span class="icon-bar"></span> 			<span class="icon-bar"></span> 			<span class="icon-bar"></span> 		</button> 		<a class="navbar-brand" href="#" contenteditable="true">Title</a> 	</div> 	<!-- Collect the nav links, forms, and other content for toggling --> 	<div class="collapse navbar-collapse navbar-ex1-collapse"> 		<ul class="nav navbar-nav ui-sortable"><li><a href="?epan=web&amp;subpage=home">Home</a></li><li><a href="?epan=web&amp;subpage=about-us">About Us</a></li></ul> 	</div><!-- /.navbar-collapse --> </nav><div id="de87fb3e-fcfb-476b-c654-ef87d4bff709" component_namespace="titleElement" component_type="Title" class="epan-component component-outline" style="background-color: rgb(255, 0, 0); color: rgb(255, 255, 255);" contenteditable="true">  	<h1>This is My title<br></h1> </div><div id="64cce488-8e25-499a-ea77-18aec36b9ab8" component_namespace="containerElement" component_type="Container" class="epan-container epan-component epan-sortable-component  ui-sortable component-outline" style=""> 	 <div style="opacity: 1; position: relative; left: 0px; top: 0px;" class="epan-component component-outline" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	{{Content}} </div> </div> </div> </div> </div> </div> </div> </div></div>\n		\n		\n		\n		\n		\n		\n		\n		', 1, 'h1{\r\ncolor:blue;\r\n}'),
(2, 1, 'epantest', '\n			\n			\n			\n			\n			\n			<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div id="92be9d27-30b6-42df-afb1-90624ee346a5" component_namespace="containerElement" component_type="Container" class="epan-container epan-component epan-sortable-component  ui-sortable" style=""> 	 <div id="649c455c-ade7-4c9b-af5c-cffaa89bd419" component_namespace="titleElement" component_type="Title" class="epan-component" style="" contenteditable="true">  	<h1>I M Title</h1> </div><nav id="0ecf5a47-5e56-4827-8571-d40bc8b793c3" component_namespace="menubarModule" component_type="MenuBar" style="" class="navbar navbar-default epan-component" role="navigation"> 	<!-- Brand and toggle get grouped for better mobile display --> 	<div class="navbar-header"> 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> 			<span class="sr-only">Toggle navigation</span> 			<span class="icon-bar"></span> 			<span class="icon-bar"></span> 			<span class="icon-bar"></span> 		</button> 		<a class="navbar-brand" href="#" contenteditable="true">Title</a> 	</div> 	<!-- Collect the nav links, forms, and other content for toggling --> 	<div class="collapse navbar-collapse navbar-ex1-collapse"> 		<ul class="nav navbar-nav ui-sortable"><li><a href="?epan=web&amp;subpage=home">Home</a></li><li><a href="?epan=web&amp;subpage=about-us">About Us</a></li></ul> 	</div><!-- /.navbar-collapse --> </nav><div id="48dad07e-0da2-47db-c4cf-d6a0b3d1f653" component_namespace="rowColumnElement" component_type="Row" class="epan-component epan-sortable-component  row ui-sortable" style="opacity: 1; position: relative; left: 0px; top: 0px; margin: 1%;"> 	 <div id="10937941-e2c9-4f7b-f90c-2bb54525d9db" component_namespace="rowColumnElement" component_type="Column" class="epan-component epan-sortable-component  col-md-4  ui-sortable" style="" span="4"> 	 <div data-extra-classes="text-center" id="67a43029-7513-47e7-cf8e-b30aca03d1c2" component_namespace="titleElement" component_type="Title" class="epan-component  text-center" style="" contenteditable="true">  	<h1>I M Title</h1> </div><div id="da0f2634-4446-4145-89ed-8977651ac4e9" component_namespace="imageElement" component_type="Image" class="epan-component" style=" "> <img src="epans/web/e.jpg" style="max-width:100%; height: auto; width:100%"> </div><div id="719547b0-ff91-4e95-9cb4-f86888f80b36" component_namespace="textElement" component_type="Text" class="editor epan-component  editor-attached" style="" contenteditable="true"> 	I M DEFAULT TEXT ... </div></div><div id="10937941-e2c9-4f7b-f90c-2bb54525d9db" component_namespace="rowColumnElement" component_type="Column" class="epan-component epan-sortable-component  col-md-4  ui-sortable" style="" span="4"> 	 <div data-extra-classes="text-center" id="67a43029-7513-47e7-cf8e-b30aca03d1c2" component_namespace="titleElement" component_type="Title" class="epan-component  text-center" style="" contenteditable="true">  	<h1>I M Title</h1> </div><div id="da0f2634-4446-4145-89ed-8977651ac4e9" component_namespace="imageElement" component_type="Image" class="epan-component" style=" "> <img src="epans/web/e.jpg" style="max-width:100%; height: auto; width:100%"> </div><div id="719547b0-ff91-4e95-9cb4-f86888f80b36" component_namespace="textElement" component_type="Text" class="editor epan-component  editor-attached" style="" contenteditable="true"> 	I M DEFAULT TEXT ... </div></div><div id="10937941-e2c9-4f7b-f90c-2bb54525d9db" component_namespace="rowColumnElement" component_type="Column" class="epan-component epan-sortable-component  col-md-4  ui-sortable" style="" span="4"> 	 <div data-extra-classes="text-center" id="67a43029-7513-47e7-cf8e-b30aca03d1c2" component_namespace="titleElement" component_type="Title" class="epan-component  text-center" style="" contenteditable="true">  	<h1>I M Title</h1> </div><div id="da0f2634-4446-4145-89ed-8977651ac4e9" component_namespace="imageElement" component_type="Image" class="epan-component" style=" "> <img src="epans/web/e.jpg" style="max-width:100%; height: auto; width:100%"> </div><div id="719547b0-ff91-4e95-9cb4-f86888f80b36" component_namespace="textElement" component_type="Text" class="editor epan-component  editor-attached" style="" contenteditable="true"> 	I M DEFAULT TEXT ... </div></div></div><div style="opacity: 1; position: relative; left: 0px; top: 0px;" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	<div id="5d9f7720__ateeditmode" class="" style=""></div>\n<div id="d2718021__rversidecomponent" class="" style=""></div>\n<div id="e2e77564__econtenteditable" class="" style=""></div>\n<div style="" class="epan-component" component_type="MainContent" component_namespace="templateRegions" id="main-content-div" contenteditable="false"> 	{{Content}} </div> </div> </div> </div> </div> </div><div id="6276f397-28a8-4641-d555-2ce51ac9f013" component_namespace="titleElement" component_type="Title" class="epan-component" style="" contenteditable="true">  	<h1>master page footer<br></h1> </div><div id="7cb52a58-fc2b-490c-a5e3-57bc8ba646a9" data-responsible-namespace="visitorCounterApp" data-responsible-view="View_VisitorCounterMain" data-is-serverside-component="true" component_namespace="visitorCounterApp" component_type="VisitorCounter" class=" epan-component " style=""> 	<div style="background-color:black; color:white">This is server side component, save your page and reload to render it</div> </div></div>\n		\n		\n		\n		\n		\n		', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `sender_signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `epan_id`, `name`, `message`, `created_at`, `is_read`, `sender_signature`) VALUES
(1, 16, 'demoMessage1', 'Hi this is for you', NULL, 0, 'khushi');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_staff_branche1` (`branch_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `branch_id`, `username`, `password`, `access_level`) VALUES
(1, 'Staff1', 1, 'xadmin', 'x123', 100);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `last_login_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `epan_id`, `name`, `username`, `password`, `created_at`, `type`, `email`, `is_active`, `activation_code`, `last_login_date`) VALUES
(2, 1, 'Admin', 'admin', 'admin', '2014-02-06', 'SuperUser', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitorCounterApp_config`
--

CREATE TABLE IF NOT EXISTS `visitorCounterApp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `show_total` tinyint(1) DEFAULT NULL,
  `show_yearly` tinyint(1) DEFAULT NULL,
  `show_monthly` tinyint(1) DEFAULT NULL,
  `show_daily` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `font_size` varchar(255) DEFAULT NULL,
  `start_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `visitorCounterApp_config`
--

INSERT INTO `visitorCounterApp_config` (`id`, `epan_id`, `show_total`, `show_yearly`, `show_monthly`, `show_daily`, `theme`, `font_size`, `start_number`) VALUES
(1, 2, 1, 0, 0, 0, 'digital', '12px', '2345'),
(2, 1, 1, 0, 0, 0, 'car', '12px', '2345');

-- --------------------------------------------------------

--
-- Table structure for table `visitorCounterApp_visits`
--

CREATE TABLE IF NOT EXISTS `visitorCounterApp_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` datetime DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
