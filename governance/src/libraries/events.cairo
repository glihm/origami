mod tokenevents {
    use starknet::ContractAddress;

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct DelegateChanged {
        #[key]
        delegator: ContractAddress,
        from: ContractAddress,
        to: ContractAddress,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct DelegateVotesChanged {
        #[key]
        delegatee: ContractAddress,
        prev_balance: u128,
        new_balance: u128,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct Transfer {
        #[key]
        from: ContractAddress,
        to: ContractAddress,
        amount: u128,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct Approval {
        #[key]
        owner: ContractAddress,
        spender: ContractAddress,
        amount: u128,
    }
}

mod timelockevents {
    use starknet::{ContractAddress, ClassHash};

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct NewAdmin {
        #[key]
        contract: ContractAddress,
        address: ContractAddress,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct NewDelay {
        #[key]
        contract: ContractAddress,
        value: u64,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct CancelTransaction {
        #[key]
        target: ContractAddress,
        class_hash: ClassHash,
        eta: u64,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct ExecuteTransaction {
        #[key]
        target: ContractAddress,
        class_hash: ClassHash,
        eta: u64,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct QueueTransaction {
        #[key]
        target: ContractAddress,
        class_hash: ClassHash,
        eta: u64,
    }
}

mod governorevents {
    use governance::models::governor::Support;
    use starknet::{ContractAddress, ClassHash};

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct ProposalCreated {
        #[key]
        id: usize,
        proposer: ContractAddress,
        target: ContractAddress,
        class_hash: ClassHash,
        start_block: u64,
        end_block: u64,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct VoteCast {
        #[key]
        voter: ContractAddress,
        proposal_id: usize,
        support: Support,
        votes: u128,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct ProposalCanceled {
        #[key]
        id: usize,
        cancelled: bool,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct ProposalQueued {
        #[key]
        id: usize,
        eta: u64,
    }

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct ProposalExecuted {
        #[key]
        id: usize,
        executed: bool,
    }
}
