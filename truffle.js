module.exports = {
  networks: {
    main: {
      host: "localhost"
      ,port: 8541
      ,network_id: "1"
    },
    ropsten: {
      host: "localhost"
      ,port: 8543
      ,network_id: "3"
    },
    rinkeby: {
      host: "localhost"
      ,port: 8544
      ,network_id: "4"
      // ,gasPrice: 20000000000
    },
    kovan: {
      host: "localhost"
      ,port: 8542
      ,network_id: "42"
    }
  }
};
