import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // add code here that will help you pass the test
  const CONSECUTIVEWINS = 10;
  for (let i = 0; i < CONSECUTIVEWINS; i++){
    let tx = await attacker.hackContract();
    await tx.wait()
  }
};

export default helper;
