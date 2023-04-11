require_relative './node'
require "byebug"
class LinkedList

    attr_accessor :head 

    def initialize
        @head = nil
    end

    def append(node)
        if head.nil?
            self.head = node
            return
        end
        last_node = head
        while last_node.next_node
          last_node = last_node.next_node
        end
        last_node.next_node = node
    end

    def prepend(node)
        node.next_node = head
        self.head = node
    end

    def delete_head
        if head.nil?
            return
        end
        new_head = head.next_node
        self.head = nil
        self.head = new_head
    end

    def delete_tail
        if head.nil?
            return 
        end
        if head.next_node.nil?
            self.head = nil
            return
        end
        last_node = head
        while last_node.next_node.next_node
            last_node = last_node.next_node
        end
        last_node.next_node = nil
    end

    def add_after(index, value)
        last_node = head
        itter = 0
        while last_node.next_node
            if itter == (index)
                old_next_node = last_node.next_node
                if !last_node.next_node.nil?
                    last_node.next_node = value
                else
                    last_node.next_node = value
                    value.next_node = old_next_node 
                end
            end
            last_node = last_node.next_node
            itter += 1
        end
        last_node.next_node = value
    end

    def search(value)
        return nil if head.nil?  # Return nil if the list is empty
    
        current_node = head
        while current_node
            if current_node.data == value  # Compare the value of the current node with the searched value
                return current_node  # If found, return the current node
            end
            current_node = current_node.next_node  # Move to the next node
        end
    
        return nil  # Return nil if the searched value is not found in the list
    end
end
