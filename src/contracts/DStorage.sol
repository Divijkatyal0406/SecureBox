pragma solidity >=0.4.21 <0.6.0;

contract DStorage {
    string public name="SecureBox";
    uint public fileCount=0;

    mapping(uint=>File) public files;
     struct Donor {
        uint donor_id;
        string firstName;
        string lastName;
        string bloodGroup;
        string height;
        string weight;
        string hospitalDoc;
        string clearance;
        uint uploadTime;
        address payable uploader;
    }
    struct Patient {
        uint patient_id;
        string firstname;
        string lastname;
        string bloodGroup;
        string height;
        string weight;
        string hospitalDoc;
        string clearance;
        uint uploadTime;
        address payable uploader;
    }

    event DonorUploaded(
        uint donor_id,
        string firstName,
        string lastName,
        string bloodGroup,
        string height,
        string weight,
        uint uploadTime,
        address payable uploader
    );
    event PatientUploaded(
        uint patient_id,
        string firstname,
        string lastname,
        string bloodGroup,
        string height,
        string weight,
        uint uploadTime,
        address payable uploader
    );

    constructor() public{

    }

    function validateMedicalData(string memory _hospitalDoc) public pure returns (string memory) {
        if (bytes(_medid).length > 0) {
            string memory _clearance = 'Eligible to donate';
            return _clearance;
        }
    }
    function addPatient(string memory _firstname, string memory _lastname, string memory _hospitalDoc,string memory _bloodGroup, string memory _height, string memory _weight) public {
    
        require(bytes(_firstname).length > 0);
        require(bytes(_lastname).length > 0);
        require(bytes(_bloodGroup).length > 0);
        require(bytes(_height).length > 0);
        require(bytes(_weight).length > 0);
        
        string memory _clearance = validateMedicalRecord(_hospitalDoc);
        
        if (bytes(_firstname).length > 0 && bytes(_lastname).length > 0 && bytes(_medid).length > 0 && bytes(_bloodtype).length > 0 && bytes(_height).length > 0 && bytes(_weight).length > 0) {
            patientCount++;
            patients[patientCount] = Patient(patientCount, _firstname, _lastname, _medid, _bloodtype, _height, _weight, _status);
        }
    }
    function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDescription) public{
        require(bytes(_fileHash).length>0);
        require(bytes(_fileType).length>0);
        require(bytes(_fileDescription).length>0);
        require(bytes(_fileName).length>0);
        require(msg.sender!=address(0));
        require(_fileSize>0);
        
        
        fileCount++;
        files[fileCount]=File(fileCount,_fileHash,_fileSize,_fileType,_fileName,_fileDescription,now,msg.sender);
        emit FileUploaded(fileCount,_fileHash,_fileSize,_fileType,_fileName,_fileDescription,now,msg.sender);
    }
}