defmodule App.Commands.ParseClass do

  require Logger

  alias App.Repo
  alias App.Models.User

  @class_rule ~r/Ты\s—\s([\w]+)\s(\d{1,})\sур./u

  def handle(message) do
    case get_class(message.text) do
      {:ok, class: class, lvl: lvl} ->

        user = Repo.get!(User, message.chat.id)
        user = Ecto.Changeset.change user, class: class, lvl: String.to_integer(lvl)
        Repo.update!(user)
        "Класс: #{class}\nУровень: #{lvl}"
      :empty ->
        "Чегой-то ты удумал? Тащи пещеру или лес!"
    end
  end

  def class_message?(text) do
    String.contains?(text, "Изученные навыки:")
  end

  defp get_class(message) do
    class = Regex.run(@class_rule, message)

    if is_nil(class) do
      :empty
    else
      [_ | [cls | [lvl]]] = class

      classes = [
        "Эсквайр",
        "Рыцарь",
        "Страж",
        "Хранитель",
        "Паладин",
        "Мастер",
        "Кузнец",
        "Добытчик"
      ]

      if String.contains?(cls, classes) do
        {:ok, class: cls, lvl: lvl}
      else
        :empty
      end
    end
  end
end