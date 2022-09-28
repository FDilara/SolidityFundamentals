// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Verifying a signature takes 4 steps

/*
 * 1.message to sign
 * 2. hash(message)
 * 3. sign(hash(message), private key) | offchain  - won't be done in smart contract
 * 4. ecrecover(hash(message), signature) == signer - verification occurs by calling the ecrecover function within the smart contract using the wallet
*/

contract VerifySig {
    //"_signer" parameter is signer address
    //"_message" parameter is message to sign
    //"_sig" parameter is signature (bytes) - Bytes result after signing by account
    function verify(address _signer, string memory _message, bytes memory _sig)
     external 
     pure 
     returns(bool)
    {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return (recover(ethSignedMessageHash, _sig) == _signer);
    }

    //Returns the hash of the entered message
    function getMessageHash(string memory _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_message));
    } 

    //It becomes the main message we sign as Offchain. 
    //Some additions will be made to the signed message and then the hashed again.
    //Returns the hash of main message
    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message:\n32",
            _messageHash
            ));
    } 

    //The address that signed the message is returned
    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig) public pure returns(address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    } 

    //Splits into three parameters
    function _split(bytes memory _sig) internal pure returns(bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "invalid signature length");

        //Total 65 byte
        assembly {
            r := mload(add(_sig, 32)) //32 byte
            s := mload(add(_sig, 64)) //32 byte    
            v := byte(0, mload(add(_sig, 96))) //1 byte
        }
    }
}

