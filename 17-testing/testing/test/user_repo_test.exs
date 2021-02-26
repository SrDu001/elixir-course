defmodule UserRepoTest do
  use ExUnit.Case
  doctest UserRepo

  test "creating users" do
    db_handler = PostgresMock.create()

    expected = %User{id: 1, name: "Frank"}
    new_user = UserRepo.createOne(db_handler, name: "Frank")
    assert expected == new_user

    expected = %User{id: 2, name: "Duban"}
    new_user = UserRepo.createOne(db_handler, name: "Duban")
    assert expected == new_user

    expected = %User{id: 3, name: "Ricardo"}
    new_user = UserRepo.createOne(db_handler, name: "Ricardo")
    assert expected == new_user
  end

  test "finding users out of range" do
    db_handler = PostgresMock.create()

    UserRepo.createOne(db_handler, name: "Frank")
    UserRepo.createOne(db_handler, name: "Duban")

    assert UserRepo.findOne(db_handler, -1) == nil
    assert UserRepo.findOne(db_handler, 0) == nil
    assert UserRepo.findOne(db_handler, 3) == nil
    assert UserRepo.findOne(db_handler, 4) == nil
  end

  test "finding users" do
    db_handler = PostgresMock.create()

    UserRepo.createOne(db_handler, name: "Frank")
    UserRepo.createOne(db_handler, name: "Duban")

    assert UserRepo.findOne(db_handler, 1) == %User{id: 1, name: "Frank"}
    assert UserRepo.findOne(db_handler, 2) == %User{id: 2, name: "Duban"}
  end
end
