<?php

namespace ecommApp;

class Model_Shop extends \Model_Table{
	public $table='ecommApp_shop';

	function init(){
		parent::init();
		$this->hasOne('Epan','epan_id')->defaultValue($this->api->current_website->id);
		$this->addField('name')->caption('Shop Name');
		$this->addField('address')->caption('Shop Address');

		$this->hasMany('ecommApp/Category','shop_id');
		$this->hasMany('ecommApp/Brand','shop_id');
		$this->hasMany('ecommApp/Order','shop_id');
		$this->hasMany('ecommApp/Member','shop_id');

		$this->addCondition('epan_id',$this->api->current_website->id);

		$this->add('dynamic_model/Controller_AutoCreator');
	}

}