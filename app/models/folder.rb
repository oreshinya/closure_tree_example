class Folder < ActiveRecord::Base
  has_closure_tree

  def to_json_tree
    tree_array_having_hash hash_tree
  end

  def tree_array_having_hash(tree)
    tree.map do |parent, children|
      {
        id: parent.id,
        name: parent.name,
        folders: tree_array_having_hash(children)
      }
    end
  end
end
