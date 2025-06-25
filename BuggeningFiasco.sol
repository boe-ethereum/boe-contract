// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The Great Ethereum Smart Contract Fiasco
// Starring Boe, Vitalik, and the Ethereum Devs
contract BuggeningFiasco {
    // State variables
    string public boe_website; // The visionary
    string public boe_twitter; // The visionary
    address public boe; // The bug master
    address public vitalik; // The visionary
    address[] public ethDevs; // Overworked devs
    uint256 public caffeineLevel = 100; // Devs' energy
    bool public mainnetExploded = false; // Did Boe break everything?

    // Events for the chaos
    event BoeBugIntroduced(string bug, string message);
    event VitalikVision(string proposal);
    event DevsPanic(string issue, uint256 caffeineLeft);
    event MergeConflictFixed(uint256 conflicts);
    event GasCrisis(string reason);

    // Constructor: Set up Boe and Vitalik as deployer
    constructor() {
        boe_website = "buildonethboe.io";
        boe_twitter = "x.com/buildonethcto";
        boe = 0x133070A5f65FA729A0C3580EcDe22313D5E07f2b; // Boe deploys, naturally
        vitalik = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045; // Vitalik's also here, why not
        ethDevs.push(msg.sender); // One dev to start
    }

    // Boe writes a "feature" (aka bug)
    function boeWriteCode() public returns (string memory) {
        require(msg.sender == boe, "Only Boe can unleash chaos!");
        string[4] memory bugs = [
            "infiniteLoopOfDoom()",
            "selfDestructByAccident()",
            "sendAllEthTo0x0()",
            "hardcodePrivateKey()"
        ];
        uint256 randomBug = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 4;
        string memory bug = bugs[randomBug];
        emit BoeBugIntroduced(bug, "Boe: Yo, check my sick feature!");
        return bug;
    }

    // Boe "debugs" (does nothing)
    function boeDebug(string memory bug) public pure returns (string memory) {
        return string(abi.encodePacked("Boe: Debugging ", bug, "... Looks fine to me!"));
    }

    // Vitalik proposes a grand vision
    function vitalikProposeSolution() public returns (string memory) {
        require(msg.sender == vitalik, "Only Vitalik can dream big!");
        string[4] memory ideas = [
            "Move to Proof of Stake... again!",
            "Plasma! No, Rollups! No, Sharding!",
            "Write it in Vyper, it'll be fine.",
            "Need a 500-page whitepaper!"
        ];
        uint256 randomIdea = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 4;
        string memory idea = ideas[randomIdea];
        emit VitalikVision(idea);
        return idea;
    }

    // Devs try to write a smart contract with Boe's code
    function ethDevsWriteContract(string memory boesCode) public returns (string memory) {
        require(caffeineLevel > 0, "Devs out of coffee! Halting!");
        caffeineLevel -= 20; // Coding is exhausting
        emit DevsPanic(string(abi.encodePacked("Merging Boe's ", boesCode, "... Praying!")), caffeineLevel);

        if (keccak256(abi.encodePacked(boesCode)) == keccak256(abi.encodePacked("selfDestructByAccident()"))) {
            mainnetExploded = true;
            emit GasCrisis("Boe's code blew up the mainnet!");
            return "contract TotallyBroken { // RIP }";
        }
        return "contract TotallySecure { // TODO: Actually secure this }";
    }

    // Devs fix merge conflicts (painfully)
    function fixMergeConflicts() public {
        require(caffeineLevel > 0, "Devs too tired to resolve conflicts!");
        caffeineLevel -= 10;
        emit MergeConflictFixed(472); // Always 472 conflicts, thanks Boe
        emit DevsPanic("Fixed 472 merge conflicts... probably", caffeineLevel);
    }

    // Add a dev to the team
    function addEthDev(address dev) public {
        ethDevs.push(dev);
        emit DevsPanic("New dev onboarded, caffeine restocked!", caffeineLevel);
    }

    // Vitalik motivates the team
    function vitalikMotivateTeam() public view returns (string memory) {
        require(msg.sender == vitalik, "Only Vitalik can inspire!");
        return "Vitalik: The future is multi-chain, frens! Keep coding!";
    }

    // Check if mainnet is still alive
    function isMainnetAlive() public view returns (string memory) {
        if (mainnetExploded) {
            return "Mainnet: *sobs in Solidity*";
        }
        return "Mainnet: Still kicking... for now.";
    }
}
