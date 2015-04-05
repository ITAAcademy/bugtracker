<?php

/**
 * This is the model class for table "defect_assignee".
 *
 * The followings are the available columns in table 'defect_assignee':
 * @property string $id_defect
 * @property string $id_assignator
 * @property string $id_assignee
 * @property string $create_date
 *
 * The followings are the available model relations:
 * @property Defect $idDefect
 * @property Users $idAssignator
 * @property Users $idAssignee
 */
class DefectAssignee extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'defect_assignee';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_defect, id_assignator, id_assignee, create_date', 'required'),
			array('id_defect, id_assignator, id_assignee', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_defect, id_assignator, id_assignee, create_date', 'safe', 'on'=>'search'),
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
			'idAssignator' => array(self::BELONGS_TO, 'Users', 'id_assignator'),
			'idAssignee' => array(self::BELONGS_TO, 'Users', 'id_assignee'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_defect' => 'Id Defect',
			'id_assignator' => 'Id Assignator',
			'id_assignee' => 'Id Assignee',
			'create_date' => 'Create Date',
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
		$criteria->compare('id_assignator',$this->id_assignator,true);
		$criteria->compare('id_assignee',$this->id_assignee,true);
		$criteria->compare('create_date',$this->create_date,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DefectAssignee the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
