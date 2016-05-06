class Order < ActiveRecord::Base
	has_many :order_details, dependent: :destroy
	accepts_nested_attributes_for :order_details, allow_destroy: true
  belongs_to :user
  has_many :order_logs, dependent: :destroy

  scope :recent, -> { order("id DESC")}
  attr_accessor :title

  attr_accessor :edituser

  after_save :add_order_log , on: :update

  def add_order_log

    OrderLog.create(:username => self.edituser,:aasm_state => self.aasm_state,:order_id => self.id)
  end

  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :paid_on_return   #訂單等待退款
    state :cancel_closed    #訂單取消結案
    state :shipping
    state :shipped
    state :ship_closed      #出貨結案
    state :goods_on_return
    state :goods_returned
    state :return_closed    #退貨結案


    event :make_payment do
      transitions from: :order_placed,    to: :paid
    end

    event :cancel_order do
      transitions from: :order_placed,    to: :cancel_closed

    end

    event :ask_for_cancel do
      transitions from: :paid,            to: :paid_on_return
    end

    event :paid_return do
      transitions from: :paid_on_return,  to: :cancel_closed
    end

    event :ship do
      transitions from: :paid,            to: :shipping
    end

    event :deliver do
      transitions from: :shipping,        to: :shipped
    end

    event :wait_ten_days do
      transitions from: :shipped,         to: :ship_closed
    end

    event :ask_for_return do
      transitions from: :shipped,         to: :goods_on_return
    end

    event :return_goods do
      transitions from: :goods_on_return, to: :goods_returned
    end

    event :make_payback do
      transitions from: :goods_returned,  to: :return_closed
    end
    #back to previos status Ray 2016-04-26
    event :un_make_payback do
      transitions from: :return_closed,  to: :goods_returned
    end

    event :un_return_goods do
      transitions from: :goods_returned, to: :goods_on_return
    end

    event :un_ask_for_return do
      transitions from: :goods_on_return, to: :shipped
    end

    event :un_wait_ten_days do
      transitions from: :ship_closed, to: :shipped
    end

    event :un_deliver do
      transitions from: :shipped,  to: :shipping
    end

    event :un_ship do
      transitions from: :shipping, to: :paid
    end

    event :un_ask_for_cancel do
      transitions from: :paid_on_return, to: :paid
    end

    event :un_paid_return do
      transitions from: :cancel_closed, to: :paid_on_return
    end

    event :un_cancel_order do
      transitions from: :cancel_closed, to: :order_placed
    end

    event :un_make_payment do
      transitions from: :paid, to: :order_placed
    end
  end
end
