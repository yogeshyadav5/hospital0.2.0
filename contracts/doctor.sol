// SPDX-License-identifier : MIT

pragma solidity ^0.8.7;

contract doctor {
    mapping (uint256 => doctor) DoctorList;

    struct doctor{
        string doc_name;
        uint doc_id;
        uint doc_phone_number;
        string doc_address;
        string doc_spec;
    }

    doctor d;

    address owner;

    constructor() public{
        owner = msg.sender;

    }

    modifier isOwner(){
        require(msg.sender == owner, "Access is not allowed");
        _;
    }

    function doc_details(uint _doc_id, uint _doc_phone_no, string memory _doc_name, string memory _doc_spec, string memory _doc_address)
     public  isOwner{
        d.doc_name = _doc_name;
        d.doc_phone_number = _doc_phone_no;
        d.doc_address = _doc_address;
        d.doc_spec = _doc_spec;
        d.doc_id = _doc_id;

        DoctorList[_doc_id] = d;

    }


    function retrived_info(uint doc_id)public  view returns(string memory, uint,string memory , string memory ){
        doctor memory d = DoctorList[doc_id];

        return(d.doc_name,d.doc_phone_number,d.doc_address,d.doc_spec);
    }



}



