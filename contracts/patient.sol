// SPDX-License-identifier : MIT
pragma solidity ^0.8.7;

contract Patient {

    mapping(uint256 => patient) PatientList;
    mapping(uint256 =>attendant) AttendantList;

     struct patient{
     string patient_name;
     uint256 patient_age;
     string patient_gender;
     string patient_height;
     uint256 patient_weight;
     string patient_address;
     uint256 patient_phone_no;
     string patient_email_id;
     uint256 date_of_visit;
     uint256 doctor_id;
    //  uint256 hospital_id;
     }
     patient p;

     struct attendant{
         uint256 patient_id;
     string attendant_name;
     string attendant_relation;
     uint256 attendant_phn_no;
     }
     attendant a;

     address owner;

      constructor()  public {
          owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //Address of Hospital
      }


      // modifier to give access only to hospital
      modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;

     }

     function store_patient_details(uint256 patient_id,string memory _patient_name,uint256 _age,string memory _gender,string memory _height,uint256 _weight,string memory _patient_address,uint256 _phone_no,string memory _email_id,uint256 _date)public isOwner {

         p.patient_name=_patient_name;
         p.patient_age=_age;
         p.patient_gender=_gender;
         p.patient_height=_height;
         p.patient_weight=_weight;
         p.patient_address=_patient_address;
         p.patient_phone_no=_phone_no;
         p.patient_email_id=_email_id;
         p.date_of_visit=_date;

        PatientList[patient_id] = p;
         }

     function store_attendant_details(uint256 patient_id,string memory _attendant_name,string memory _attendant_relation, uint256 _attendant_phn_no)public isOwner {

         a.patient_id = patient_id;
        a.attendant_name=_attendant_name;
         a.attendant_relation=_attendant_relation;
         a.attendant_phn_no=_attendant_phn_no;

         AttendantList[patient_id] = a;
     }

     function retreive_patient_details(uint256 patient_id) public view returns (string memory,uint256,string memory,string memory,uint256,string memory,uint256,string memory,uint256){
         patient memory p = PatientList[patient_id];

     return (p.patient_name,p.patient_age,p.patient_gender,p.patient_height,p.patient_weight,p.patient_address,p.patient_phone_no,p.patient_email_id,p.date_of_visit);

     }

     function retreive_attendant_details(uint256 patient_id) public view returns (string memory,string memory,uint256){

          attendant memory a = AttendantList[patient_id];

      return (a.attendant_name,a.attendant_relation,a.attendant_phn_no);

     }

}