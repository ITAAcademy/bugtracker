<?php

/**
 * This is the model class for table "defect".
 *
 * The followings are the available columns in table 'defect':
 * @property string $id
 * @property string $id_project
 * @property string $create_date
 * @property string $short_name
 *
 * The followings are the available model relations:
 * @property Projects $idProject
 * @property DefectAssignee[] $defectAssignees
 * @property DefectHistory[] $defectHistories
 */
class Defect extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'defect';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_project, create_date, short_name', 'required'),
			array('id_project', 'length', 'max'=>10),
			array('short_name', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, id_project, create_date, short_name', 'safe', 'on'=>'search'),
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
			'idProject' => array(self::BELONGS_TO, 'Projects', 'id_project'),
			'defectAssignees' => array(self::HAS_MANY, 'DefectAssignee', 'id_defect'),
			'defectHistories' => array(self::HAS_MANY, 'DefectHistory', 'id_defect'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_project' => 'Id Project',
			'create_date' => 'Create Date',
			'short_name' => 'Short Name',
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

		$criteria->compare('id',$this->id,true);
		$criteria->compare('id_project',$this->id_project,true);
		$criteria->compare('create_date',$this->create_date,true);
		$criteria->compare('short_name',$this->short_name,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Defect the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
