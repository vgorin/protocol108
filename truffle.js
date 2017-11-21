module.exports = {
  networks: {
    main: {
      host: "localhost"
      ,port: 8545
      ,network_id: "1"
    },
    ropsten: {
      host: "localhost"
      ,port: 8545
      ,network_id: "3"
    },
    rinkeby: {
      host: "localhost"
      ,port: 8545
      ,network_id: "4"
      // ,gasPrice: 20000000000
    },
    kovan: {
      host: "localhost"
      ,port: 8545
      ,network_id: "42"
    }
  }
};
