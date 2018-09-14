defmodule GW.Access.Query do
    @moduledoc """
    The boundary for the Access.Query system.
    """
  
    import Ecto.Query, warn: false
    import Ecto.Changeset
    alias GW.Repo
  
    alias GW.Access
  
    @doc """
    Returns the list of access types.
    ## Examples
        iex> list_access()
        [%Access{}, ...]
    """
    def list_access do
      Repo.all(Access)
    end
  
    @doc """
    Gets a single access.
    Raises `Ecto.NoResultsError` if the Access does not exist.
    ## Examples
        iex> get_access!(123)
        %Access{}
        iex> get_access!(456)
        ** (Ecto.NoResultsError)
    """
    def get_access!(id), do: Repo.get!(Access, id)
  
    @doc """
    Creates an access.
    ## Examples
        iex> create_access(%{field: value})
        {:ok, %Access{}}
        iex> create_access(%{field: bad_value})
        {:error, %Ecto.Changeset{}}
    """
    def create_access(attrs \\ %{}) do
      %Access{}
      |> Access.changeset(attrs)
      |> Repo.insert()
    end
  
    @doc """
    Updates an access type.
    ## Examples
        iex> update_access(access, %{field: new_value})
        {:ok, %Access{}}
        iex> update_access(access, %{field: bad_value})
        {:error, %Ecto.Changeset{}}
    """
    def update_access(%Access{} = access, attrs) do
      access
      |> Access.changeset(attrs)
      |> Repo.update()
    end
  
    @doc """
    Deletes a Access.
    ## Examples
        iex> delete_access(access)
        {:ok, %Access{}}
        iex> delete_access(access)
        {:error, %Ecto.Changeset{}}
    """
    def delete_access(%Access{} = access) do
      Repo.delete(access)
    end
  
    @doc """
    Returns an `%Ecto.Changeset{}` for tracking access changes.
    ## Examples
        iex> change_access(access)
        %Ecto.Changeset{source: %Access{}}
    """
    def change_access(%Access{} = access) do
      Access.changeset(access, %{})
    end
  end