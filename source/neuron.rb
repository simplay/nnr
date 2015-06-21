# A neuron acts as a vertex in a NN graph.
# It is responsible for partially classify (non-linearly) a given input
class Neuron

  def initialize(idx)
    init_weight = rand
    @idx = idx
    @weights = init_weight
    @to_neurons = []
    flush_input_impulses
  end

  def transfer_impulse
    stimulus = determine_stimulus #apply dilation later
    to_neurons.each do |neuron|
      neuron.register_input(@idx, stimulus)
    end
    flush_input_impulses
  end

  # implements the back-propagation algorithm
  # relying on a gradient descent solver.
  # REPEAT UNTIL convergence criterion met DO
  #   Input TrainingData to Network and then comput network outputs
  #   Foreach output unit k Do
  #     d_k = sigmoid_k * (1-sigmoid_k)*(t_k - sigmoid_k)
  #   Foreach hidden unit h Do
  #     d_h = sigmoid_h *(1-sigmoid_h)*sum_{k \in outputs} w_h,k * d_k
  #   Update w_i,j = w_i,j + delta_w_i,j with
  #   with delta_w_i,j = eta*d_j*x_i,j
  def learn_weights
    raise 'not implemented yet'
  end

  def to_neurons
    @to_neurons
  end

  private

  def register_input(at_idx, value)
    @input_impulse[at_idx] = value
  end

  def determine_stimulus
    @input_impulses.each_with_index do |stimulus, idx|
      @weights[idx]*simulus
    end
  end

  def flush_input_impulses
    @input_impulses = []
  end

end
