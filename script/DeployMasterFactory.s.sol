// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/DirectDemocracyVotingFactory.sol";
import "../src/DirectDemocracyTokenFactory.sol";
import "../src/HybridVotingFactory.sol";
import "../src/ParticipationTokenFactory.sol";
import "../src/ParticipationVotingFactory.sol";
import "../src/TreasuryFactory.sol";
import "../src/MembershipNFTFactory.sol";
import "../src/RegistryFactory.sol";
import "../src/TaskManagerFactory.sol";
import "../src/QuickJoinFactory.sol";
import "../src/MasterDeployFactory.sol";
import "../src/UniversalAccountRegistry.sol";
import "../src/ElectionContractFactory.sol";
import "../src/EducationHubFactory.sol"; // Import EducationHubFactory

contract DeployMasterFactory is Script {
    function run() external returns (address masterFactoryAddress) {
        vm.startBroadcast();

        AccountManager accountManager = new AccountManager();
        DirectDemocracyVotingFactory directDemocracyVotingFactory = new DirectDemocracyVotingFactory();
        DirectDemocracyTokenFactory directDemocracyTokenFactory = new DirectDemocracyTokenFactory();
        HybridVotingFactory hybridVotingFactory = new HybridVotingFactory();
        ParticipationTokenFactory participationTokenFactory = new ParticipationTokenFactory();
        ParticipationVotingFactory participationVotingFactory = new ParticipationVotingFactory();
        TreasuryFactory treasuryFactory = new TreasuryFactory();
        NFTMembershipFactory nftMembershipFactory = new NFTMembershipFactory();
        RegistryFactory registryFactory = new RegistryFactory();
        TaskManagerFactory taskManagerFactory = new TaskManagerFactory();
        QuickJoinFactory quickJoinFactory = new QuickJoinFactory();
        ElectionContractFactory electionContractFactory = new ElectionContractFactory();
        EducationHubFactory educationHubFactory = new EducationHubFactory(); // Instantiate EducationHubFactory

        MasterFactory masterFactory = new MasterFactory(
            address(directDemocracyTokenFactory),
            address(directDemocracyVotingFactory),
            address(hybridVotingFactory),
            address(participationTokenFactory),
            address(participationVotingFactory),
            address(treasuryFactory),
            address(nftMembershipFactory),
            address(registryFactory),
            address(taskManagerFactory),
            address(quickJoinFactory),
            address(accountManager),
            address(electionContractFactory),
            address(educationHubFactory) // Pass EducationHubFactory address to the MasterFactory constructor
        );

        vm.stopBroadcast();

        // Return the master factory address
        return address(masterFactory);
    }
}
