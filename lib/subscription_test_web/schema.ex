defmodule SubscriptionTestWeb.Schema do
  use Absinthe.Schema

  query do
    field :ping, non_null(:string) do
      resolve fn(_, _) ->
        {:ok, "pong"}
      end
    end
  end

  object :comment do
    field :content, :string
    field :repository_name, :string
  end

  mutation do
    field :submit_comment, :comment do
      arg :repo_name, non_null(:string)
      arg :content, non_null(:string)

      resolve fn(args, _) ->
        IO.puts "Trigger mutation executed"
        {:ok, %{content: args.content, repository_name: args.repo_name, topic: args.repo_name }}
      end
    end
  end

  subscription do
    field :comment_added, :comment do
      arg :repo_name, non_null(:string)

      trigger :submit_comment, topic: fn comment ->
        comment.repository_name
      end

      config fn args, _ ->
        IO.puts "Configuring subscription"
        {:ok, topic: args.repo_name}
      end

      resolve fn comment, _, _ ->
        IO.puts "Resolving subscription"
        {:ok, comment}
      end
    end
  end
end

