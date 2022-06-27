pragma solidity ^0.8.4;

import "node_modules/@openzeppelin/contracts/token/ERC721";

contract Body_Examine is ERC721 {
    mapping(uint256 => tests) PatientTest;
    mapping(uint256 => scan) ScanTest;
    mapping(uint256 => system) SystemExamine;
    mapping(uint256 => prev) PreviousDates;
    mapping(uint256 => patient) PatientList;

    struct patient {
        uint256 patient_id;
    }
    patient p;
    struct prev {
        uint256 patient_id;
        string previous;
    }
    prev pr;

    struct tests {
        uint256 patient_id;
        string blood_test;
        string urine_test;
        string ecg;
        string mri_scan;
        string ct_scan;
        string xray;
        string lab_test;
    }
    tests t;
    struct scan {
        uint256 patient_id;
        string built;
        string nouirishment;
        string eyes;
        string tongue;
        uint64 pulse;
        uint64 temp;
        string blood_pressure;
        uint64 respiratory_rate;
    }
    scan s;
    struct system {
        uint256 patient_id;
        string cns;
        string cvs;
        string rs;
        string abdomen;
    }
    system sys;

    address owner;

    constructor() public ERC721("MedicalCoin", "MEDC") {
        owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; //Address of Doctor
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access is not allowed");

        _;
    }

    function namedecl() public view returns (string memory) {
        return name();
    }

    function symboldecl() public view returns (string memory) {
        return symbol();
    }

    function totalSupplycount() public view returns (uint256) {
        return totalSupply();
    }

    function medical_record(uint256 patient_id) public {
        _mint(msg.sender, patient_id);

        PatientList[patient_id] = p;
    }

    function previous_dates(uint256 patient_id, string memory _previous)
        public
        isOwner
    {
        pr.previous = _previous;

        PreviousDates[patient_id] = pr;
    }

    function get_previous_dates(uint256 patient_id)
        public
        view
        returns (string memory)
    {
        prev memory pr = PreviousDates[patient_id];
        return (pr.previous);
    }

    function investigations(
        uint256 patient_id,
        string memory _blood_test,
        string memory _urine_test,
        string memory _ecg,
        string memory _mri_scan,
        string memory _ct_scan,
        string memory _xray,
        string memory _lab_test
    ) public isOwner {
        t.blood_test = _blood_test;
        t.urine_test = _urine_test;
        t.ecg = _ecg;
        t.mri_scan = _mri_scan;
        t.ct_scan = _ct_scan;
        t.xray = _xray;
        t.lab_test = _lab_test;

        PatientTest[patient_id] = t;
    }

    function get_investigations(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        tests memory t = PatientTest[patient_id];

        return (
            t.blood_test,
            t.urine_test,
            t.ecg,
            t.mri_scan,
            t.ct_scan,
            t.xray,
            t.lab_test
        );
    }

    function general_examin(
        uint256 patient_id,
        string memory _built,
        string memory _nouirishment,
        string memory _eyes,
        string memory _tongue,
        uint64 _pulse,
        string memory _blood_pressure,
        uint64 _temp,
        uint64 _respiratory_rate
    ) public isOwner {
        s.built = _built;
        s.nouirishment = _nouirishment;
        s.eyes = _eyes;
        s.tongue = _tongue;
        s.pulse = _pulse;
        s.blood_pressure = _blood_pressure;
        s.temp = _temp;
        s.respiratory_rate = _respiratory_rate;

        ScanTest[patient_id] = s;
    }

    function get_general_examin(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            uint64,
            string memory,
            uint64,
            uint64
        )
    {
        scan memory s = ScanTest[patient_id];

        return (
            s.built,
            s.nouirishment,
            s.eyes,
            s.tongue,
            s.pulse,
            s.blood_pressure,
            s.temp,
            s.respiratory_rate
        );
    }

    function sys_examin(
        uint256 patient_id,
        string memory _cvs,
        string memory _cns,
        string memory _rs,
        string memory _abdomen
    ) public isOwner {
        sys.cvs = _cvs;
        sys.cns = _cns;
        sys.rs = _rs;
        sys.abdomen = _abdomen;
        systemexamine[patient_id] = sys;
    }

    function get_sys_examin(uint256 patient_id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        system memory sys = systemexamine[patient_id];
        return (sys.cvs, sys.cns, sys.rs, sys.abdomen);
    }
}
