<?php

/**
 * This is the model class for table "users".
 *
 * The followings are the available columns in table 'users':
 * @property string $id
 * @property string $login
 * @property string $password
 * @property string $email
 * @property string $fullname
 * @property integer $canAddProject
 *
 * The followings are the available model relations:
 * @property DefectAssignee[] $defectAssignees
 * @property DefectAssignee[] $defectAssignees1
 * @property DefectHistory[] $defectHistories
 * @property UsersRoles[] $usersRoles
 */
class Users extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'users';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('login, password, email, fullname, canAddProject', 'required'),
			array('canAddProject', 'numerical', 'integerOnly'=>true),
			array('login, password', 'length', 'max'=>42),
			array('email, fullname', 'length', 'max'=>256),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, login, password, email, fullname, canAddProject', 'safe', 'on'=>'search'),
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
			'defectAssignees' => array(self::HAS_MANY, 'DefectAssignee', 'id_assignator'),
			'defectAssignees1' => array(self::HAS_MANY, 'DefectAssignee', 'id_assignee'),
			'defectHistories' => array(self::HAS_MANY, 'DefectHistory', 'id_user'),
			'usersRoles' => array(self::HAS_MANY, 'UsersRoles', 'id_user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'код користувача',
			'login' => 'Login',
			'password' => 'Password',
			'email' => 'Email',
			'fullname' => 'Fullname',
			'canAddProject' => 'Can Add Project',
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
		$criteria->compare('login',$this->login,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('fullname',$this->fullname,true);
		$criteria->compare('canAddProject',$this->canAddProject);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Users the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
