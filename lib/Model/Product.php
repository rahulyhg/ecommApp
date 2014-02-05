<?php

namespace ecommApp;

class Model_Product extends \Model_Table{
	public $table='ecommApp_Product';

	function init(){
		parent::init();
		$this->hasOne('ecommApp/Category','category_id');
		$this->hasOne('ecommApp/Brand','brand_id');
		$this->addField('name')->Caption('Product Name');
		$this->addField('is_active')->type('boolean')->Caption('Publish ');
		$this->addField('code')->Caption('Product SKU');
		$this->addField('alias')->Caption('Product Alias');
		$this->addField('image')->display(array('form'=>'ElImage'));
		$this->addField('rate')->type('float');
		$this->addField('gross_amount')->type('float');
		$this->addField('tax_amount')->type('float');
		$this->addField('discount_amount')->type('float');
		$this->addField('net_amount')->type('float');
	
		$this->addField('length')->Caption('Product Length');
		$this->addField('width')->Caption('Product Width');
		$this->addField('height')->Caption('Product Height');
		$this->addField('weight')->setValueList(array(
													'kg'=>'KiloGramme',
													'gramme'=>'Gramme',
													'mg'=>'milligramme',
													'pound'=>'Pound'))->Caption('Product Weight');
		
		$this->addField('extra_info')->system(true);
		$this->addField('description')->type('text')->Caption('Product Description');
		$this->addField('meta_keyword')->type('text')->Caption('Meta Keyword');
		$this->addField('meta_description')->type('text')->Caption('Meta Description');
		
		$this->hasMany('ecommApp/CustomFields','product_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}