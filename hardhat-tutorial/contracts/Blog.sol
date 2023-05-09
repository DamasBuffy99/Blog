// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Blog is Ownable{
    struct Project {
        string titre;
        string description;
    }    

    uint public id;
    mapping(uint=>Project) public projects;
    string[] public suggestions; 

    function addContent (string memory _titre,string memory _description) external onlyOwner {
        Project storage project = projects[id];
        project.titre = _titre;
        project.description = _description;
    }

    function addSuggestion(string memory _suggestion) external{
        require(_suggestion.length>0,"Whrite something naggea!");
        suggestions.push(_suggestion);
    }

    function getTotalSuggestions() view public returns(uint){
        return suggestions.length;
    }
 
    function getTotalProjects() view public returns(uint){
        return id;
    }

}
