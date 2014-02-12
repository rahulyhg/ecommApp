<?php

namespace ecommApp;

class Model_Product extends \Model_Table{
	public $table='ecommApp_Product';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Shop','shop_id')->defaultValue($this->add('ecommApp/Model_Shop')->loadAny()->get('id'));
		$this->hasOne('ecommApp/Category','category_id');
		$this->hasOne('ecommApp/Brand','brand_id');
		$this->addField('name')->Caption('Product Name');
		$this->addField('is_active')->type('boolean')->Caption('Publish ');
		$this->addField('code')->Caption('Product SKU');
		$this->addField('alias')->Caption('Product Alias');
		$this->addField('image')->display(array('form'=>'ElImage'))->caption('Main Image');
		$this->addField('price')->Caption('Product Price');
		
	
		
		
		$this->addField('description')->type('text')->Caption('Product Description');
		$this->addField('meta_keyword')->type('text')->Caption('Meta Keyword');
		$this->addField('meta_description')->type('text')->Caption('Meta Description');
		
		$this->hasMany('ecommApp/CustomFields','product_id');
		$this->hasMany('ecommApp/ProductDetails','product_id');

		$this->addCondition('shop_id',$this->add('ecommApp/Model_Shop')->loadAny()->get('id'));

		$this->add('dynamic_model/Controller_AutoCreator');
	}
}