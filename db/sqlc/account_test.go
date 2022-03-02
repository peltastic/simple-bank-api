package db

import (
	"github.com/peltastic/simple-bank-api/util"
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateAccount(t *testing.T) {
 arg := CreateAccountParams {
	 Owner: util.RandomOwner(),
	 Balance: util.RandomMoney(),
	 Currency: util.RandomCurrency(),
 }
 account, err := testQueries.CreateAccount(context.Background(), arg)
 require.NoError(t, err) // this line checks that the error must be nil and will automatically fail the test if it isn't
 require.NotEmpty(t, account)

 require.Equal(t, arg.Owner, account.Owner)
 require.Equal(t, arg.Balance, account.Balance)
 require.Equal(t, arg.Currency, account.Currency)

 require.NotZero(t, account.ID)
 require.NotZero(t, account.CreatedAt)

}

// we use testify package to check the result of this test. Its more concise than using standard if else statement
//go get github.com/stretchr/testify