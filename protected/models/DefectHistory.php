<?php

/**
 * This is the model class for table "defect_history".
 *
 * The followings are the available columns in table 'defect_history':
 * @property string $id_defect
 * @property string $id_operation
 * @property string $create_date
 * @property string $id_user
 *
 * The followings are the available model relations:
 * @property Defect $idDefect
 * @property DefectTransition $idOperation
 * @property Users $idUser
 */
class DefectHistory extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'defect_history';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_defect, id_operation, id_user', 'required'),
			array('id_defect, id_operation, id_user', 'length', 'max'=>10),
			array('create_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_defect, id_operation, create_date, id_user', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idDefect' => array(self::BELONGS_TO, 'Defect', 'id_defect'),
			'idOperation' => array(self::BELONGS_TO, 'DefectTransition', 'id_operation'),
			'idUser' => array(self::BELONGS_TO, 'Users', 'id_user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_defect' => 'Id Defect',
			'id_operation' => 'Id Operation',
			'create_date' => 'Create Date',
			'id_user' => 'Id User',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id_defect',$this->id_defect,true);
		$criteria->compare('id_operation',$this->id_operation,true);
		$criteria->compare('create_date',$this->create_date,true);
		$criteria->compare('id_user',$this->id_user,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DefectHistory the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
