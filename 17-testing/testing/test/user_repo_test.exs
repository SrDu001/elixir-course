defmodule UserRepoTest do
  use ExUnit.Case
  doctest UserRepo

  test "UserRepoImpl.pid is nil" do
    repo = %UserRepoImpl{pid: nil}
    assert_raise FunctionClauseError, fn -> UserRepo.findOne(repo, 1) end
  end

  test "creating users" do
    repo = PostgresMock.create() |> UserRepoImpl.create()

    expected = %User{id: 1, name: "Frank"}
    new_user = UserRepo.createOne(repo, name: "Frank")
    assert expected == new_user

    expected = %User{id: 2, name: "Duban"}
    new_user = UserRepo.createOne(repo, name: "Duban")
    assert expected == new_user

    expected = %User{id: 3, name: "Ricardo"}
    new_user = UserRepo.createOne(repo, name: "Ricardo")
    assert expected == new_user
  end

  test "finding users out of range" do
    repo = PostgresMock.create() |> UserRepoImpl.create()

    UserRepo.createOne(repo, name: "Frank")
    UserRepo.createOne(repo, name: "Duban")

    assert UserRepo.findOne(repo, -1) == nil
    assert UserRepo.findOne(repo, 0) == nil
    assert UserRepo.findOne(repo, 3) == nil
    assert UserRepo.findOne(repo, 4) == nil
  end

  test "finding users" do
    repo = PostgresMock.create() |> UserRepoImpl.create()

    UserRepo.createOne(repo, name: "Frank")
    UserRepo.createOne(repo, name: "Duban")

    assert UserRepo.findOne(repo, 1) == %User{id: 1, name: "Frank"}
    assert UserRepo.findOne(repo, 2) == %User{id: 2, name: "Duban"}
  end

  test "UserRepoImpl2.pid is nil" do
    repo = %UserRepoImpl2{db: nil}
    assert_raise FunctionClauseError, fn -> UserRepo.findOne(repo, 1) end
  end

  test "UserRepoImpl2 as struct" do
    db_handler = PostgresMock.create()
    repo = UserRepoImpl2.create(db_handler)

    assert UserRepo.createOne(repo, name: "Frank") == %User{id: 1, name: "Frank"}
    assert UserRepo.createOne(repo, name: "Duban") == %User{id: 2, name: "Duban"}

    assert UserRepo.findOne(repo, 1) == %User{id: 1, name: "Frank"}
    assert UserRepo.findOne(repo, 2) == %User{id: 2, name: "Duban"}

    assert UserRepo.findOne(repo, -1) == nil
    assert UserRepo.findOne(repo, 0) == nil
    assert UserRepo.findOne(repo, 3) == nil
    assert UserRepo.findOne(repo, 4) == nil

  end
end
