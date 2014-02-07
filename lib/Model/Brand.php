<?php

namespace ecommApp;

class Model_Brand extends \Model_Table{
	public $table='ecommApp_Brand';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id');
		$this->addField('name')->Caption('Brand Name');
		$this->addField('image')->display(array('form'=>'ElImage'));
		$this->addField('description')->type('text')->Caption('Brand Description');
		$this->addField('Meta_keyword')->type('text')->Caption('Meta KeyWord');
		$this->addField('meta_description')->type('text')->Caption('Meta Description');

		$this->hasMany('ecommApp/Product','brand_id');
		$this->addCondition('shop_id',$this->add('ecommApp/Model_Shop')->loadAny()->get('id'));
		$this->addHook('beforeSave',$this);
		$this->addHook('beforeDelete',$this);
		
		

		$this->add('dynamic_model/Controller_AutoCreator');
	}
		function beforeDelete(){
			if($this->ref('ecommApp/Product')->count()->getOne() >0)
			throw new \Exception("You can not Delete brand It Contain Product");
			
		}

		function beforeSave(){
			$old_brand=$this->add('ecommApp/Model_Brand');
			$old_brand->addCondition('name',$this['name']);
			if($this->loaded())
				$old_brand->addCondition('id','<>',$this->id);

			$old_brand->tryLoadAny();
			if($old_brand->loaded())
				throw new \Exception("this Name Is alredy Exits "	);
				
		}
}